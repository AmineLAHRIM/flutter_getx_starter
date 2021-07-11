import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_starter/app/core/theme/app_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

/*
* Here All what you need about LightThemeTheme
* */
class LightTheme {
  static final LightTheme _singleton = LightTheme._internal();

  factory LightTheme() {
    return _singleton;
  }

  LightTheme._internal();

  //static const Color primary = Color(0xFF0082FF);
  final Color primaryColor = Colors.black;
  final Color secondery = Color(0xFF323232);
  final Color seconderyLight = Color(0xFFFAFAFC);
  final Color backgroundColor = Colors.white;
  final Color shadowColor = Color(0xFF00001A).withOpacity(0.10);
  final Color accentColor = Color(0xFF0082FF);
  final Color buttonColor = Color(0xFF0082FF);
  final Color splashColor = Color(0xFF2B6FFC);
  final Color recommended = Color(0xFFE74C3C);
  final Color danger = Color(0xFFDC676C).withOpacity(0.8);
  final Color bgDanger = Color(0xFFFA6400).withOpacity(0.1);
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
        shadowColor: shadowColor,
        brightness: Brightness.light,
        textTheme: AppTextTheme.textTheme(),
      );

  // SystemUiOverlayStyle
  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        // StatusBar
        statusBarColor: backgroundColor,
        // status bar color
        statusBarBrightness: Brightness.light,
        //status bar brigtness
        statusBarIconBrightness: Brightness.dark,
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
        statusBarColor: splashColor,
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
        systemNavigationBarColor: splashColor,
        // navigation bar color
        systemNavigationBarDividerColor: splashColor,
        //Navigation bar divider color
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icon
      );

/*
  * for Proxima Nova added height 1.4 because there is a padding with original font file that fixed with the height 1.4
  * to be
  * */

}
