import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_getx_starter/app/core/constant.dart';
import 'package:flutter_getx_starter/app/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseRemoteConfigService {
  NetworkInfo? networkInfo;
  // this need to update options
  Dio? dio;

  FirebaseRemoteConfigService({this.networkInfo,this.dio}) {
    networkInfo!.connectionRestoredStream.stream.listen((event) {
      refreshData();
    });
  }

  Future<bool> initialize() async {
    print('welcome message: initialize');

    //return Future.value(true);
    try {
      final RemoteConfig remoteConfig = RemoteConfig.instance;
      final defaults = <String, dynamic>{
        'host_url': Constant.HOST_URL,
      };
      await remoteConfig.setDefaults(defaults);
      print('welcome message: setDefaults');
      //await remoteConfig.fetch(expiration: const Duration(seconds: 5));
      //set configuartin about fetchTimeout and minimumFetchInterval: time of cache
      await remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(minutes: 1), minimumFetchInterval: const Duration(seconds: 5)));
      return fetchData(remoteConfig: remoteConfig);
    } catch (err) {
      print('welcome message: err ${err}');
      //return Future.value(false);
      await Future.delayed(Duration(seconds: 1));
      return false;
    }
  }

  Future<bool> fetchData({required RemoteConfig remoteConfig}) async {
    try {
      final isUpdated = await remoteConfig.fetchAndActivate();
      if (isUpdated) {
      } else {}
      print('welcome message: fetchAndActivate');
      Constant.HOST_URL = remoteConfig.getString('host_url');
      updateApiBaseOptions();


      print('welcome message: ${dio!.options.baseUrl}');
      print('welcome message: ${remoteConfig.getAll()}');
      return true;
    } catch (e) {
      return false;
    }
  }

  void refreshData() {
    fetchData(remoteConfig: RemoteConfig.instance);
  }

  void updateApiBaseOptions() {
    Constant.options.baseUrl=Constant.REMOTE_URL;
    dio!.options = Constant.options;
  }
}
