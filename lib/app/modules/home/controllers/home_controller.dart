import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/theme/dark/dark_theme.dart';
import 'package:flutter_getx_starter/app/core/theme/light/light_theme.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateLightMode() {
    Get.changeTheme(LightTheme().themeData);
  }

  updateLocale({required Locale locale}) {
    Get.updateLocale(locale);
  }

  updateDarkMode() {
    Get.changeTheme(DarkTheme().themeData);
  }


  void increment() => count.value++;


}
