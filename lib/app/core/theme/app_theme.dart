import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_starter/app/core/theme/app_sizes.dart';
import 'package:flutter_getx_starter/app/core/theme/dark/dark_theme.dart';
import 'package:flutter_getx_starter/app/core/theme/light/light_theme.dart';
import 'package:get/get.dart';

/*
* Here CustomColors for AppTheme (because ThemeData didn't support more custom attribute)
* with the switch of Dark/Light Mode
* */
extension CustomColors on ThemeData {
  Color get CprimaryColor => Get.isDarkMode ? DarkTheme().primaryColor : LightTheme().primaryColor;
  Color get CsearchBar => Get.isDarkMode ? DarkTheme().primaryColor.withOpacity(0.1) : LightTheme().primaryColor.withOpacity(0.05);
  Color get Csecondery => Get.isDarkMode ? DarkTheme().secondery : LightTheme().secondery;
  Color get CsearchBarContainer => Get.isDarkMode ? DarkTheme().secondery2 : LightTheme().backgroundColor;
  Color get Csecondery2 => Get.isDarkMode ? DarkTheme().secondery2 : LightTheme().secondery;
  Color get Csecondery3 => Get.isDarkMode ? DarkTheme().secondery3 : LightTheme().secondery;
  Color get Csecondery4 => Get.isDarkMode ? DarkTheme().secondery4 : LightTheme().secondery;
  Color get CseconderyLight => Get.isDarkMode ? DarkTheme().seconderyLight : LightTheme().seconderyLight;
  Color get CbackgroundColor => Get.isDarkMode ? DarkTheme().backgroundColor : LightTheme().backgroundColor;
  Color get CshadowColor => Get.isDarkMode ? DarkTheme().shadowColor : LightTheme().shadowColor;
  Color get CaccentColor => Get.isDarkMode ? DarkTheme().accentColor : LightTheme().accentColor;
  Color get CbuttonColor => Get.isDarkMode ? DarkTheme().buttonColor : LightTheme().buttonColor;
  Color get CsplashColor => Get.isDarkMode ? DarkTheme().splashColor : LightTheme().splashColor;
  Color get Crecommended => Get.isDarkMode ? DarkTheme().recommended : LightTheme().recommended;
  Color get Cdanger => Get.isDarkMode ? DarkTheme().danger : LightTheme().danger;
  Color get CbgDanger => Get.isDarkMode ? DarkTheme().bgDanger : LightTheme().bgDanger;
  Color get Csuccess => Get.isDarkMode ? DarkTheme().success : LightTheme().success;
}

class AppTheme {
  static InputDecoration inputDecoration({
    String? hintText,
    bool hasBorderSide = true,
    double radius = AppSizes.borderRadius,
    Color? backgroundColor,
  }) {
    return InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? Get.theme.colorScheme.onBackground,
        contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
        hintText: hintText,
        errorStyle: Get.theme.textTheme.subtitle2!.copyWith(color: Get.theme.colorScheme.error),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          borderSide: hasBorderSide
              ? BorderSide(
            color: Get.theme.hintColor,
            width: AppSizes.borderSideWidth / 2,
          )
              : BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          borderSide: hasBorderSide
              ? BorderSide(
            color: Get.theme.hintColor,
            width: AppSizes.borderSideWidth,
          )
              : BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          borderSide: hasBorderSide
              ? BorderSide(
            color: Get.theme.hintColor,
            width: AppSizes.borderSideWidth,
          )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          borderSide: hasBorderSide
              ? BorderSide(
            color: Get.theme.hintColor,
            width: AppSizes.borderSideWidth,
          )
              : BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          borderSide: hasBorderSide
              ? BorderSide(
            color: Get.theme.hintColor,
            width: AppSizes.borderSideWidth,
          )
              : BorderSide.none,
        ),
        border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            borderSide: hasBorderSide
                ? BorderSide(
              width: AppSizes.borderSideWidth,
              color: Get.theme.hintColor,
            )
                : BorderSide.none),
        hintStyle: Get.theme.textTheme.subtitle2!.copyWith(color: Get.theme.hintColor));
  }

  static ThemeData get themeData {
    if (Get.isDarkMode) {
      return DarkTheme().themeData;
    }
    return LightTheme().themeData;
  }

  static SystemUiOverlayStyle get systemUiOverlayStyle {
    if (Get.isDarkMode) {
      return DarkTheme().systemUiOverlayStyle;
    }
    return LightTheme().systemUiOverlayStyle;
  }

  static SystemUiOverlayStyle get systemUiLaunchOverlayStyle {
    if (Get.isDarkMode) {
      return DarkTheme().systemUiLaunchOverlayStyle;
    }
    return LightTheme().systemUiLaunchOverlayStyle;
  }

  static SystemUiOverlayStyle get systemUiTransparentOverlayStyle {
    if (Get.isDarkMode) {
      return DarkTheme().systemUiTransparentOverlayStyle;
    }
    return LightTheme().systemUiTransparentOverlayStyle;
  }

  void setupLaunchSystemSettings() {
    // this will change color of status bar and system navigation bar
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiLaunchOverlayStyle);

    // this will prevent change oriontation
    setupPortraitMode();
  }

  void setupSystemSettings() {
    // this will change color of status bar and system navigation bar
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiOverlayStyle);
    // this will prevent change oriontation
    //AppSizes.isMobile ? setupPortraitMode() : setupDefaultMode();
    setupDefaultMode();
  }

  void setupTransparentSystemSettings() {
    // this will change color of status bar and system navigation bar
    SystemChrome.setSystemUIOverlayStyle(
        AppTheme.systemUiTransparentOverlayStyle);
    //Oriontation Mode
    //SizeConfig.isMobile ? setupPortraitMode() : setupDefaultMode();
    setupDefaultMode();
  }

  // Portrait Mode Only
  void setupPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // Portrait + Landscape Mode
  void setupDefaultMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
