import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/error/errors.dart';
import 'package:flutter_getx_starter/app/core/loading/loading_state.dart';
import 'package:flutter_getx_starter/app/shared/shared_snackbar.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailController extends GetxController {
  //TODO: Implement DetailController
  // this only decalre here so shared snackbar know wher exact scaffold to appear message on it
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // we create this to simulate a waiting for rest api to give us the name form a server for example
  final pageState = Rx<LoadingState?>(null);
  late StreamSubscription pageStateSub;

  String myname = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    pageStateSub =
        SharedSnackBar(loadingState: pageState, scaffoldKey: scaffoldKey)
            .setupListener();

    callApi();
  }

  @override
  void onClose() {}

  void callApi({bool succuss = true}) async {
    pageState.value = LOADING();
    await Future.delayed(Duration(seconds: 5));
    // this will executed after 5 sec
    if (succuss) {
      myname = 'Amine';
      pageState.value = LOADED();
    } else {
      pageState.value =
          ERROR(message: 'sorry loaded failed', type: MessageType.danger);
    }
  }
}
