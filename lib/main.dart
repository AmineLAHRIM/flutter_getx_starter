import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/di/injection.dart';
import 'package:flutter_getx_starter/app/core/theme/app_sizes.dart';
import 'package:flutter_getx_starter/app/core/theme/app_theme.dart';
import 'package:flutter_getx_starter/app/core/theme/dark/dark_theme.dart';
import 'package:flutter_getx_starter/app/core/theme/light/light_theme.dart';
import 'package:flutter_getx_starter/app/core/translation/messages.dart';
import 'package:flutter_getx_starter/app/services/notification_service.dart';
import 'package:flutter_getx_starter/generated/locales.g.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // configure DI dependency injection
  await configureDependencies();

  // FCM App in Background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //Handle ForgroundNotification From App Closed
  NotificationService.initOpenForgroundNotifcationAppClosed();

  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        // init sizes
        AppSizes().init(constraints, orientation);
        // Setup Theme for NavigationBar and Status Bar for the Launch
        AppTheme().setupLaunchSystemSettings();
        return GestureDetector(
          onTap: () {
            WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: LocaleKeys.app_name.tr,
            smartManagement: SmartManagement.full,
            themeMode: ThemeMode.system,
            theme: LightTheme().themeData,
            darkTheme: DarkTheme().themeData,
            debugShowCheckedModeBanner: false,
            //translationsKeys: AppTranslation.translations,
            translations: Messages(),
            locale: Get.deviceLocale,
            // in case the locale of the device not exist in the app
            fallbackLocale: Locale('en', 'US'),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        );
      });
    });
  }
}
