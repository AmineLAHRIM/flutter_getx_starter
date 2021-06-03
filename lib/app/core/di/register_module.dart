import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getx_starter/app/core/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  //@singleton
  //DataConnectionChecker get dataConnectionChecker;

  @singleton
  Connectivity get connectivity;

  /*@singleton
  http.Client get client => http.Client();*/

  // url here will be injected
  @lazySingleton
  Dio dio() => Dio(Constant.options);

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

/*@preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();*/
}
