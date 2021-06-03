import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_starter/app/core/size_config.dart';
import 'package:flutter_getx_starter/app/core/theme/default/default_theme.dart';

class AppTheme {
  static ThemeData get themeData {
    bool isDarkMode = false;
    if (isDarkMode) {
      //return DarkTheme.themeData;
    }
    return DefaultTheme.themeData;
  }

  static SystemUiOverlayStyle get systemUiOverlayStyle {
    bool isDarkMode = false;
    if (isDarkMode) {
      //return DarkTheme.systemUiOverlayStyle;
    }
    return DefaultTheme.systemUiOverlayStyle;
  }

  static SystemUiOverlayStyle get systemUiLaunchOverlayStyle {
    bool isDarkMode = false;
    if (isDarkMode) {
      //return DarkTheme.systemUiLaunchOverlayStyle;
    }
    return DefaultTheme.systemUiLaunchOverlayStyle;
  }

  static SystemUiOverlayStyle get systemUiTransparentOverlayStyle {
    bool isDarkMode = false;
    if (isDarkMode) {
      //return DarkTheme.systemUiLaunchOverlayStyle;
    }
    return DefaultTheme.systemUiTransparentOverlayStyle;
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
    SizeConfig.isMobile ? setupPortraitMode() : setupDefaultMode();
    //setupDefaultMode();
  }

  void setupTransparentSystemSettings() {
    // this will change color of status bar and system navigation bar
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiTransparentOverlayStyle);
    // this will prevent change oriontation
    SizeConfig.isMobile ? setupPortraitMode() : setupDefaultMode();
    //setupDefaultMode();
  }

  // this will prevent change oriontation
  void setupPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // this will not prevent change oriontation
  void setupDefaultMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
