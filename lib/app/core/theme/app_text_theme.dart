import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/*
fontWeight
* 100 Thin
200 Extra Light
300 Light
400 Regular
500 Medium
600 Semi Bold
700 Bold
800 Extra Bold
900 Ultra Bold
* */

/*
* Here Text Theme for the App
* some fontWeight can be overridden in the app by .copyWith
* */
class AppTextTheme {
  static TextTheme textTheme() {
    return TextTheme(
      headline1: GoogleFonts.sen().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      headline2: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
      headline3: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headline4: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      headline5: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      headline6: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      button: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      subtitle1: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      subtitle2: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w500,
        //height: 1.4,
        fontSize: 13,
      ),
      bodyText1: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      bodyText2: GoogleFonts.quicksand().copyWith(
        color: Get.theme.CprimaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }
}
