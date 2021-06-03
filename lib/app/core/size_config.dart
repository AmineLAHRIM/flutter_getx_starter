import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;
  static double? screenWidth;
  static double? screenHeight;
  static late bool isMobile;

  static const double footerHeight = kBottomNavigationBarHeight;

  // static const double headerTitleHeight=120;
  static const double headerTitleHeight = 70;
  static const double headerActionsHeight = 90;
  static const double headerAuthHeight = 120;
  static const double footerItemsRadius = 0;
  static const double borderSideWidth = 1.4;
  static const double height8XL = 70;
  static const double height7XL = 65;
  static const double height6XL = 60;
  static const double height5XL = 55;
  static const double height4XL = 50;
  static const double height3XL = 45;
  static const double heightXXL = 40;
  static const double heightXL = 35;
  static const double heightL = 30;
  static const double heightM = 25;
  static const double heightS = 20;
  static const double heightXS = 16;
  static const double tabsHeight = 50;
  static const double SOCIETY_LOGO_HEIGHT_PR = 0.14;
  static const double heightLoading = 22;

  static const double borderFilterRadius = 100;
  static const double borderRadius = 10;
  static const double borderRadiusModal = 20;

  static const double LIST_EVENT_RATIO = 3.8 / 4;
  static const double LIST_SMALL_RATIO = 4 / 1;
  static const double LIST_UNIVERSITY_RATIO = 5 / 1;
  static const double GRID_TICKET_ORDER_RATIO = 2.8 / 1;
  static const double SMALL_TICKET_ORDER_RATIO = 3.5 / 1;

  static const double gridMaxCrossAxisExtent = 450;

  static const double FILTER_RATIO = 2.4 / 1;

  static const double HIGHT_FACTOR_ACTIONBAR = 0.5;
  static const double SMALL_MOBILE_HEIGHT = 400.0;
  static const Alignment HEADER_ALIGENMENT = Alignment(-1, 0.5);

  static double HIGHT_FACTOR_EVENT_DETAIL_IMAGE = 0.3;

  //static const double LIST_RATIO = 1 / 1;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth! < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = screenWidth! / 100;
    _blockHeight = screenHeight! / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;

    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    // The equivalent of the "smallestWidth" qualifier on Android.
    var smallestDimension = constraints.biggest.shortestSide;

    // Determine if we should use mobile layout or not. The
    // number 600 here is a common breakpoint for a typical
    // 7-inch tablet.
    //isMobile = smallestDimension < 600;
    isMobile = screenWidth! < 600;
  }

  bool isScrollable({int? tabLenght, required BuildContext context}) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SizeConfig.screenWidth! < tabLenght! * 120 ? true : false;
    } else {
      return SizeConfig.screenHeight! < tabLenght! * 120 ? true : false;
    }
  }
}
