import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_getx_starter/app/core/constant.dart';
import 'package:flutter_getx_starter/app/data/datasources/local/hive_constant.dart';
import 'package:flutter_getx_starter/app/data/models/dto/fcm_push_notifcation_dto.dart';
import 'package:flutter_getx_starter/app/routes/notification_routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class NotificationService {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  var fcmToken = ''.obs;
  List<RemoteMessage> remoteMessages = [];
  late AndroidNotificationChannel channel;
  late Dio dio;

  NotificationService() {
    dio = Dio();

    fcmToken.listen((value) {
      print('[fcmtoken] $value');
    });
  }

  Future<NotificationSettings> requestFCMPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings;
  }

  setupFCMTokenListener() async {
    fcmToken.value = (await FirebaseMessaging.instance.getToken())!;
    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      fcmToken.value = token;
    });
  }

  void refreshFcmToken() async {
    fcmToken.value = (await FirebaseMessaging.instance.getToken())!;
  }

  Future subscribeToTopics({List<String> topics = const []}) async {
    topics.forEach((topic) async {
      await FirebaseMessaging.instance.subscribeToTopic('$topic');
    });
  }

  Future unsubscribeFromTopics({List<String> topics = const []}) async {
    topics.forEach((topic) async {
      await FirebaseMessaging.instance.unsubscribeFromTopic('$topic');
    });
  }

  Future subscribeToTopic({String? topic}) async {
    if (topic?.isNotEmpty != null) await FirebaseMessaging.instance.subscribeToTopic('$topic');
  }

  Future unsubscribeFromTopic({String? topic}) async {
    if (topic?.isNotEmpty != null) await FirebaseMessaging.instance.unsubscribeFromTopic('$topic');
  }

  void simulateNewEventCreatedBySociety() {
    final societyId = 18;
    final imageUrlTest = 'https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg';

    final fcmPushNotificationDto = FcmPushNotificationDto(
      topic: 'society_id_$societyId',
      title: 'just title test from society $societyId',
      body: 'body of notification society',
      data: {
        'event_id': '14',
      },
      imageUrl: imageUrlTest,
    );

    sendPushMessage(fcmPushNotificationDto: fcmPushNotificationDto);
  }

  Future initializeBackgroundFCM() async {
    // Open app from notification
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    print('[fcmBackground] initializeBackgroundFCM');
    setuphandlerBackgroundFCM(message: initialMessage);
  }

  Future initializeForgroundFCM() async {
    print('[fcmlocal] initializeForgroundFCM');

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    //_getForgroundNotification(payload: '$PAYLOAD_TEST');
    handleOpenForgroundNotifcationAppClosed();

    channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("ic_launcher");
    IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
    );
    final InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

    final settings = await requestFCMPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      setupFCMTokenListener();
      setuphandlerForegroundFCM(initializationSettings: initializationSettings);
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    } else {}
  }

  void handleNotificationRoute({RemoteMessage? message}) async {
    final notificationRoute = await _getNotificationRoute(message: message);
    if (notificationRoute != null) {
      if (!(Get.currentRoute == notificationRoute.page && Get.arguments == notificationRoute.id)) Get.toNamed(notificationRoute.page!, arguments: notificationRoute.id);
    }
  }

  void setuphandlerForegroundFCM({required InitializationSettings initializationSettings}) async {
    // Here Listener for Notification Clicked
    print('[fcmlocal] handleForegroundFCM initialize');
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (payload) async {
      print('[fcmlocal] handleForegroundFCM initialize executed');

      var payloadHaveCachedNotification = false;
      var openedRemoteMessage;
      final index = remoteMessages.indexWhere((element) => element.messageId == payload);
      print('[fcmlocal] handleForegroundFCM index=${index}');

      // Handle if Notification saved only in Array
      if (index != -1) {
        payloadHaveCachedNotification = true;
        openedRemoteMessage = remoteMessages[index];
        remoteMessages.removeAt(index);
      } else {
        // Handle if Notification cached locally after user want to close app and open the Foreground Notification After
        payloadHaveCachedNotification = true;

        openedRemoteMessage = await _getForgroundNotification(payload: payload);
        print('[fcmlocal] handleForegroundFCM _getForgroundNotification openedRemoteMessage=${openedRemoteMessage}');
      }
      print('[fcmlocal] handleForegroundFCM payloadHaveCachedNotification=${payloadHaveCachedNotification}');

      if (payloadHaveCachedNotification) {
        handleNotificationRoute(message: openedRemoteMessage);
      }
    });

    // handle FirebaseMessaging Forground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // save RemoteMessage in Array
      remoteMessages.add(message);
      //cache RemoteMessage if user close app then open notificaiton
      await _cacheForgroundNotification(message: message);
      //showNotificationWithAttachment();
      showForegroundFCM(message: message);

      if (message.notification != null) {}
    });
  }

  //Instant Notifications
  Future showForegroundFCM({RemoteMessage? message}) async {
    if (message?.notification != null) {
      RemoteNotification? notification = message!.notification;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null) {
        AndroidNotification? androidNotification = notification.android;
        AppleNotification? appleNotification = notification.apple;
        var platform;

        if (GetPlatform.isAndroid && androidNotification != null) {
          var filePath;
          if ((androidNotification.imageUrl?.isImageFileName != null) == true) {
            final ext = androidNotification.imageUrl!.split('.').last;
            filePath = await _downloadAndSaveFile(url: androidNotification.imageUrl, fileName: '${DateTime.now()}.$ext');
          }

          var bigPicture = BigPictureStyleInformation(filePath != null ? FilePathAndroidBitmap(filePath) : DrawableResourceAndroidBitmap("ic_launcher"), largeIcon: filePath != null ? FilePathAndroidBitmap(filePath) : null, contentTitle: notification.title, summaryText: notification.body, hideExpandedLargeIcon: true, htmlFormatContent: true, htmlFormatContentTitle: true);
          // Android
          final android = AndroidNotificationDetails(
            channel.id, channel.name, channel.description,
            importance: Importance.max,
            priority: Priority.max,
            //playSound: true,
            icon: androidNotification.smallIcon,
            largeIcon: filePath != null ? FilePathAndroidBitmap(filePath) : null,
            styleInformation: filePath != null ? bigPicture : null,
            // other properties...
          );

          print('[fcmlocal] Android showForegroundFCM ${filePath}');

          platform = new NotificationDetails(android: android);
        } else if (GetPlatform.isIOS && appleNotification != null) {
          var filePath;
          if ((appleNotification.imageUrl?.isImageFileName != null) == true) {
            final ext = appleNotification.imageUrl!.split('.').last;
            filePath = await _downloadAndSaveFile(url: appleNotification.imageUrl, fileName: '${DateTime.now()}.$ext');
          }

          // IOS
          final ios = IOSNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            attachments: filePath != null ? [IOSNotificationAttachment(filePath)] : null,
          );
          print('[fcmlocal] IOS showForegroundFCM ${filePath}');

          platform = new NotificationDetails(iOS: ios);
        }

        // show local notification
        if (platform != null)
          await _flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            platform,
            payload: message.messageId,
          );
      }
    }
  }

  Future<void> showNotificationWithAttachment() async {
    var attachmentPicturePath = await _downloadAndSaveFile(url: ' https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', fileName: 'attachment_img.jpg');
    var iOSPlatformSpecifics = IOSNotificationDetails(
        // attachments: [IOSNotificationAttachment(attachmentPicturePath)],
        );
    /*var bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(attachmentPicturePath),
      contentTitle: '<b>Attached Image</b>',
      htmlFormatContentTitle: true,
      summaryText: 'Test Image',
      htmlFormatSummaryText: true,
    );*/

    var notificationDetails = NotificationDetails(iOS: iOSPlatformSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Title with attachment',
      'Body with Attachment',
      notificationDetails,
    );
  }

  Future<NotificationRoute?> _getNotificationRoute({RemoteMessage? message}) async {
    var notificationRoute;
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    /*initialMessage = RemoteMessage(data: {
      'event_id': '14',
    });*/
    if (message != null) {
      final foundedRoute = NotificationRoute.routes.keys.firstWhere((route) {
        return message.data.containsKey(route);
      }, orElse: () {
        return null;
      });
      if (foundedRoute != null) {
        final page = NotificationRoute.getPage(route: foundedRoute);
        final id = int.tryParse(message.data[foundedRoute]);
        if (page != null && id != null) {
          notificationRoute = NotificationRoute(page: page, id: id);
        }
      }
    }

    return notificationRoute;
  }

  Future<String?> _downloadAndSaveFile({String? url, String? fileName}) async {
    try {
      if (url != null && fileName != null) {
        var directory = await getApplicationDocumentsDirectory();
        var filePath = '${directory.path}/$fileName';
        await dio.download(
          url,
          filePath,
          onReceiveProgress: (count, total) {
            //
          },
        );
        return filePath;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void setNotifyForTopic({String? topic, bool isNotify = true}) {
    // set notifiy for a specify topic
    if (isNotify) {
      subscribeToTopic(topic: topic);
    } else {
      unsubscribeFromTopic(topic: topic);
    }
  }

  void setuphandlerBackgroundFCM({RemoteMessage? message}) async {
    print('[fcmBackground] handleBackgroundFCM');
    // Resume app from notifcation after it was paussed
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print('[fcmBackground] onMessageOpenedApp');
      handleNotificationRoute(message: message);
    });

    handleNotificationRoute(message: message);
  }

  Future<void> sendPushMessage({required FcmPushNotificationDto fcmPushNotificationDto}) async {
    if (fcmPushNotificationDto.advancedMessage!.token == null && fcmPushNotificationDto.advancedMessage!.topic == null) {
      return;
    }

    final accountCredentials = ServiceAccountCredentials.fromJson({
      "private_key_id": Constant.GOOGLE_APPLICATION_CREDENTIALS['private_key_id'],
      "private_key": Constant.GOOGLE_APPLICATION_CREDENTIALS['private_key'],
      "client_email": Constant.GOOGLE_APPLICATION_CREDENTIALS['client_email'],
      "client_id": Constant.GOOGLE_APPLICATION_CREDENTIALS['client_id'],
      "type": Constant.GOOGLE_APPLICATION_CREDENTIALS['type'],
    });

    var client = http.Client();
    AccessCredentials credentials = await obtainAccessCredentialsViaServiceAccount(accountCredentials, Constant.GOOGLE_APPLICATION_FCM_SCOPES, client);
    client.close();

    try {
      final firebaseApp = await Firebase.initializeApp();

      final response = await dio.post(
        'https://fcm.googleapis.com/v1/projects/${firebaseApp.options.projectId}/messages:send',
        data: fcmPushNotificationDto.toJson(),
        /*{
          "message": {
            "token": "${ipadToken}",
            "notification": {"body": "This is an FCM notification message from LUNA!", "title": "FCM Message"},
            "android": {
              "notification": {"image": "${imageUrlTest}"}
            },
            "apns": {
              "payload": {
                "aps": {"mutable-content": 1}
              },
              "fcm_options": {"image": "${imageUrlTest}"}
            },
          }
        },*/
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${credentials.accessToken.data}'},
        ),
      );
      //final responseData = response.data;

      if (response.statusCode == 200) {
      } else {
        throw DioError(response: response, requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      final response = e.response;
      if (response?.data == null || response!.statusCode! >= 500) {
        return;
      }
    }
  }

  Future<void> _cacheForgroundNotification({RemoteMessage? message}) async {
    try {
      if (message != null) {
        final Box box = await Hive.openBox(FORGROUND_NOTI_BOX);

        await box.put(message.messageId, message.data);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<RemoteMessage?> _getForgroundNotification({String? payload}) async {
    print('[fcmlocal] handleForegroundFCM _getForgroundNotification payload=${payload}');

    if (payload != null) {
      var message;
      Box? forgroundNotification;

      try {
        forgroundNotification = await Hive.openBox(FORGROUND_NOTI_BOX);
        print('[fcmlocal] handleForegroundFCM _getForgroundNotification Hive.openBox');
        final LinkedHashMap<dynamic, dynamic> getdata = forgroundNotification.get(payload);
        final data = getdata.map((key, value) => MapEntry(key as String, value));
        print('[fcmlocal] handleForegroundFCM _getForgroundNotification data=${data}');

        if (data != null) {
          message = RemoteMessage(messageId: payload, data: data);
          forgroundNotification.delete(payload);
        }
      } catch (e) {
        print(e);
      }
      forgroundNotification?.close();
      return message;
    }
  }

  void handleOpenForgroundNotifcationAppClosed() async {
    if (Constant.openedNotificationPayload?.isNotEmpty ?? false) {
      final payload = Constant.openedNotificationPayload;
      Constant.openedNotificationPayload = null;
      final message = await _getForgroundNotification(payload: payload);
      if (message != null) {
        handleNotificationRoute(message: message);
      }
    }
  }

  static void initOpenForgroundNotifcationAppClosed() async {
    print('[fcmlocal] initOpenForgroundNotifcationAppClosed');

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final NotificationAppLaunchDetails? notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      Constant.openedNotificationPayload = notificationAppLaunchDetails!.payload;
    }
  }
}
