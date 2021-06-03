// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../modules/home/controllers/home_controller.dart' as _i4;
import '../network/network_info.dart' as _i5;
import 'register_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
  gh.factory<_i4.HomeController>(() => _i4.HomeController());
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(connectivity: get<_i6.Connectivity>()));
  await gh.factoryAsync<_i7.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.singleton<_i6.Connectivity>(registerModule.connectivity);
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {
  @override
  _i6.Connectivity get connectivity => _i6.Connectivity();
}
