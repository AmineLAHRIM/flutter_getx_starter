import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/constant.dart';
import 'package:flutter_getx_starter/app/core/error/errors.dart';
import 'package:flutter_getx_starter/app/core/loading/loading_state.dart';
import 'package:flutter_getx_starter/app/core/theme/light/light_theme.dart';
import 'package:get/get.dart';

class SharedSnackBar {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Rx<LoadingState?>? loadingState;
  MessageType? messageType;
  String? message;
  bool skipDuplicatedMsg;
  var errorShowedDateTime = DateTime.now();
  final snackbarDurationToHide = Duration(seconds: 4);

  SharedSnackBar({this.scaffoldKey, this.loadingState, this.skipDuplicatedMsg = false});

  int i = 0;

  StreamSubscription setupListener() {
    StreamSubscription loadingSub = loadingState!.listen((value) {
      print('loadingState' + value.toString());

      // ERROR
      if (value is ERROR) {
        if (!skipDuplicatedMsg && message == value.message && messageType == value.type && DateTime.now().difference(errorShowedDateTime) <= snackbarDurationToHide) {
          print('return ERROR');
          return;
        }
        message = value.message;
        messageType = value.type;
      } else if (value is LOADED) {
        if (!skipDuplicatedMsg && message == value.message && messageType == value.type && DateTime.now().difference(errorShowedDateTime) <= snackbarDurationToHide) {
          print('return LOADED');
          return;
        }
        message = value.message;
        messageType = value.type;
      } else {
        return;
      }

      if (messageType != null && message != null) {
        Color color = LightTheme().primaryColor;
        switch (messageType) {
          case MessageType.info:
            color = LightTheme().info.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          case MessageType.danger:
            color = LightTheme().danger.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          case MessageType.success:
            color = LightTheme().success.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          case MessageType.warning:
            color = LightTheme().warning.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          default:
            color = LightTheme().primaryColor.withOpacity(Constant.SNACK_BAR_OPACITY);
        }

        errorShowedDateTime = DateTime.now();
        /*ScaffoldMessenger.of(scaffoldKey.currentContext)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
          content: Text(
            message,
            style: Get.theme.textTheme.bodyText1.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: color,
        ));
*/
        if (scaffoldKey?.currentState != null) {
          scaffoldKey!.currentState!
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  message!,
                  style: Get.theme.textTheme.bodyText1!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: color,
              ),
            );
        }
      }
    });
    return loadingSub;
  }
}