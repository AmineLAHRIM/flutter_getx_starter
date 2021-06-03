import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/generated/locales.g.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      translationsKeys: AppTranslation.translations,
      locale: Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
