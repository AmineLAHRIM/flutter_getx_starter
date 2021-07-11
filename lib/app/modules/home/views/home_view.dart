import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/di/injection.dart';
import 'package:flutter_getx_starter/app/core/theme/app_theme.dart';
import 'package:flutter_getx_starter/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_starter/app/routes/app_pages.dart';
import 'package:flutter_getx_starter/generated/locales.g.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isTransUpdated = false;

  /*
  * you can use tag if this View can be viewd multi time in a certain navigation
  * example for a productView if a user enter to home then productView then see similar products and click on a product will lead to other productView with diffrent id then you can use tag
  * so the new productView will create a NEW productController fully new with new params
  * */
  //final controller = Get.put(getIt<HomeController>(), tag: '${UniqueKey()}');
  final controller = Get.put(getIt<HomeController>());

  @override
  Widget build(BuildContext context) {
    // Setup Theme for NavigationBar and Status Bar for the System App
    AppTheme().setupSystemSettings();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        backgroundColor: Get.theme.CbuttonColor,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              LocaleKeys.buttons_login.tr,
              style: Get.textTheme.bodyText1!.copyWith(color: Get.theme.CprimaryColor,fontWeight: FontWeight.w700),
              maxLines: 1,
              minFontSize: 24,
              maxFontSize: 32,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isTransUpdated) {
                    controller.updateLocale(locale: Locale('en', 'US'));
                  } else {
                    controller.updateLocale(locale: Locale('pt', 'BR'));
                  }
                  isTransUpdated = !isTransUpdated;
                });
              },
              child: Text('Toggle Translation'),
            ),
            ElevatedButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  controller.updateLightMode();
                } else {
                  controller.updateDarkMode();
                }
                isTransUpdated = !isTransUpdated;
              },
              child: Text('Toggle Theme Mode'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Obx(() {
                /*
                * this number is reactive and will not rebuild the whole view from build
                * only from Obx will be rebuild so this increase perforamnce
                * */
                final number = controller.count.value;
                return Text('Increment Reactive = ${number}');
              }),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.DETAIL);
              },
              child: Text('Go Detail Page'),
            ),
          ],
        ),
      ),
    );
  }
}
