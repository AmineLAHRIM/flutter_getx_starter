import 'package:dio/dio.dart';
import 'package:flutter_getx_starter/app/core/size_config.dart';
import 'package:intl/intl.dart';

class Constant {
  Constant();

  // REST API CONFIG
  static var HOST_URL = 'URL_HERE';

  static String get REMOTE_URL => HOST_URL + '/api';

  static const LIST_PAGE_SIZE = 10;

  static final DateFormat backendDateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

  // or new Dio with a BaseOptions instance.
  static final BaseOptions options = new BaseOptions(
    baseUrl: REMOTE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  /*
  * GOOGLE_APPLICATION_CREDENTIALS to generate FCM_SERVER_TOKEN
  * */
  static Map<String, String> GOOGLE_APPLICATION_CREDENTIALS = {
    "private_key_id": "9*****03",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMI********g5g\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-rdtji@******.iam.gserviceaccount.com",
    "client_id": "*****.apps.googleusercontent.com",
    "type": "service_account"
  };

  /*
  * GOOGLE_APPLICATION_FCM_SCOPES for push Notifcations
  * */
  static List<String> GOOGLE_APPLICATION_FCM_SCOPES = [
    'https://www.googleapis.com/auth/cloud-platform.read-only',
    'https://www.googleapis.com/auth/firebase.messaging',
  ];

  /*
  * save payload for a notifcation that open the closed app
  * */
  static String? openedNotificationPayload;
}
