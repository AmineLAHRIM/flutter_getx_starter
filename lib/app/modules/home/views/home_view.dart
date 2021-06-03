import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/core/di/injection.dart';
import 'package:flutter_getx_starter/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_starter/generated/locales.g.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isTransUpdated = false;
  final controller = Get.put(getIt<HomeController>(), tag: '${UniqueKey()}');

  updateLocale({required Locale locale}) {
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.buttons_login.tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isTransUpdated) {
                      updateLocale(locale: Locale('en', 'US'));
                    } else {
                      updateLocale(locale: Locale('pt', 'BR'));
                    }
                    isTransUpdated = !isTransUpdated;
                  });
                },
                child: Text('Toggle Translation'))
          ],
        ),
      ),
    );
  }
}
