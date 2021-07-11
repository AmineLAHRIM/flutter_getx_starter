import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_starter/app/core/theme/app_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

/*
* Here All what you need about DarkTheme
* */
class DarkTheme {
  static final DarkTheme _singleton = DarkTheme._internal();

  factory DarkTheme() {
    return _singleton;
  }

  DarkTheme._internal();

  final Color primaryColor = Colors.white;
  final Color secondery = Color(0xFF323232);
  final Color secondery2 = Color(0xFF222222);
  final Color secondery3 = Color(0xFF383838);
  final Color secondery4 = Color(0xFF323232);
  final Color seconderyLight = Color(0xFFE8E8E8);
  final Color backgroundColor = Color(0xFF111111);
  final Color shadowColor = Color(0xFF00001A).withOpacity(0.10);
  final Color accentColor = Color(0xFF0082FF);
  final Color buttonColor = Color(0xFF0082FF);
  final Color splashColor = Color(0xFF2B6FFC);
  final Color recommended = Color(0xFFE74C3C);
  final Color danger = Color(0xFFE74C3C).withOpacity(0.1);
  final Color bgDanger = Color(0xFFF28C8C);
  final Color success = Color(0xFF2ECC71);

  final Color warning = Color(0xFFF7B500);
  final Color info = Color(0xFF636978);

  // ThemeData
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        buttonColor: buttonColor,
        accentColor: accentColor,
        splashColor: splashColor,
        backgroundColor: backgroundColor,
        highlightColor: accentColor,
        brightness: Brightness.dark,
        shadowColor: shadowColor,
        textTheme: AppTextTheme.textTheme(),
      );

  // SystemUiOverlayStyle
  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        // StatusBar
        statusBarColor: backgroundColor,
        // status bar color
        statusBarBrightness: Brightness.light,
        //status bar brigtness
        statusBarIconBrightness: Brightness.light,
        //status barIcon Brightness
        // NavigationBar
        systemNavigationBarColor: backgroundColor,
        // navigation bar color
        systemNavigationBarDividerColor: backgroundColor,
        //Navigation bar divider color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icon
      );

  // systemUiLaunchOverlayStyle
  SystemUiOverlayStyle get systemUiLaunchOverlayStyle => SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: splashColor,
        systemNavigationBarDividerColor: splashColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  SystemUiOverlayStyle get systemUiTransparentOverlayStyle =>
      SystemUiOverlayStyle(
        // StatusBar
        statusBarColor: Colors.transparent,
        // status bar color
        statusBarBrightness: Brightness.dark,
        //status bar brigtness
        statusBarIconBrightness: Brightness.light,
        //status barIcon Brightness
        // NavigationBar
        systemNavigationBarColor: primaryColor,
        // navigation bar color
        systemNavigationBarDividerColor: primaryColor,
        //Navigation bar divider color
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icon
      );
}
