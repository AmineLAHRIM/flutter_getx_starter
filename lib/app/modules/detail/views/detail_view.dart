import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/loading/loading_state.dart';
import 'package:flutter_getx_starter/app/core/theme/app_theme.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.CbackgroundColor,
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text('DetailView'),
        backgroundColor: Get.theme.CbuttonColor,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              final pageState = controller.pageState.value;
              if (pageState is LOADING) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (pageState is LOADED) {
                final myname=controller.myname;
                return AutoSizeText(
                  'My Name is ${myname}',
                  style: Get.textTheme.bodyText1!.copyWith(color: Get.theme.CprimaryColor,fontWeight: FontWeight.w700),
                  maxLines: 1,
                  minFontSize: 24,
                  maxFontSize: 32,
                );
              } else if (pageState is ERROR) {
                // in this case it will automaticly show a snackbar because it's already implemented in onReady to listen for ERROR state
              }

              return Container();
            }),
            ElevatedButton(
              onPressed: () {
                controller.callApi();
              },
              child: Text('call api with success Data'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.callApi(succuss: false);
              },
              child: Text('call api with failure Data'),
            ),
          ],
        ),
      ),
    );
  }
}
