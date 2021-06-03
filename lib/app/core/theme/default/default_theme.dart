import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTheme {
  // Colors
  static const Color primary = Color(0xFF4A62E2);
  static const Color secondary = Color(0xFF4B4C67);

  //static const Color textColor = Color(0xFF2E3034);

  static const Color danger = Color(0xFFF82956);
  static const Color success = Color(0xFF6DD400);
  static const Color warning = Color(0xFFF7B500);
  static const Color info = Color(0xFF636978);

  
  static const Color bg = Color(0xFF192032);
  
  static Color shadow = Color(0xFFDDDDDD);
  static const double radius = 10.0;

  // ThemeData

  static final ThemeData themeData = ThemeData(
    primaryColor: primary,
    accentColor: secondary,
    splashColor: bg,
    highlightColor: primary,
    fontFamily: 'Proxima Nova',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    ),
  );

  // TextTheme
  static final TextTheme textTheme = TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    button: button,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
  );

  // SystemUiOverlayStyle
  static final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    // StatusBar
    statusBarColor: primary,
    // status bar color
    statusBarBrightness: Brightness.dark,
    //status bar brigtness
    statusBarIconBrightness: Brightness.light,
    //status barIcon Brightness
    // NavigationBar
    systemNavigationBarColor: Colors.white,
    // navigation bar color
    systemNavigationBarDividerColor: Colors.white,
    //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  );

  // systemUiLaunchOverlayStyle
  static final SystemUiOverlayStyle systemUiLaunchOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: primary,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: primary,
    systemNavigationBarDividerColor: primary,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static final SystemUiOverlayStyle systemUiTransparentOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /*
  * for Proxima Nova added height 1.4 because there is a padding with original font file that fixed with the height 1.4
  * to be
  * */
  // Text Styles
  static final TextStyle headline1 = TextStyle(
    color: Colors.white,
    fontFamily: "Proxima Nova",
    fontWeight: FontWeight.w700,
    fontSize: 32,
  );
  static final TextStyle headline2 = TextStyle(
    fontFamily: "Proxima Nova",
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );
  static final TextStyle headline3 = TextStyle(
    color: Colors.white,
    fontFamily: "Proxima Nova",
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static final TextStyle headline4 = TextStyle(
    color: Colors.white,
    fontFamily: "Proxima Nova",
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static final TextStyle headline5 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 1.4,
    fontFamily: "Proxima Nova",
    fontSize: 16,
  );
  static final TextStyle headline6 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: "Proxima Nova",
    fontSize: 14,
  );

  static final TextStyle button = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontFamily: "Proxima Nova",
    fontSize: 15,
  );

  static final TextStyle subtitle1 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: "Proxima Nova",
    fontSize: 13,
  );

  static final TextStyle subtitle2 = TextStyle(
    color: Colors.white,
    fontFamily: "Proxima Nova",
    fontWeight: FontWeight.w400,
    height: 1.4,
    fontSize: 13,
  );

  static final TextStyle bodyText1 = TextStyle(
    color: primary,
    fontFamily: "Proxima Nova",
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static final TextStyle bodyText2 = TextStyle(
    color: primary,
    fontFamily: "Proxima Nova",
    height: 1.4,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );


}
