import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/constant.dart';
import 'package:flutter_getx_starter/app/core/error/errors.dart';
import 'package:flutter_getx_starter/app/core/loading/loading_state.dart';
import 'package:flutter_getx_starter/app/core/theme/default/default_theme.dart';
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

      if (value != null && value is ERROR) {
        if (!skipDuplicatedMsg && message == value.message && messageType == value.type && DateTime.now().difference(errorShowedDateTime) <= snackbarDurationToHide) {
          print('return ERROR');
          return;
        }
        message = value.message;
        messageType = value.type;
      } else {
        return;
      }

      if (messageType != null && message != null) {
        Color color = DefaultTheme.primary;
        switch (messageType) {
          case MessageType.info:
            color = DefaultTheme.info.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          case MessageType.danger:
            color = DefaultTheme.danger.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          case MessageType.success:
            color = DefaultTheme.success.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          case MessageType.warning:
            color = DefaultTheme.warning.withOpacity(Constant.SNACK_BAR_OPACITY);
            break;
          default:
            color = DefaultTheme.primary.withOpacity(Constant.SNACK_BAR_OPACITY);
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
