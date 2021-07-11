// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i13;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../data/datasources/local/repos/local_example_repo.dart' as _i7;
import '../../data/datasources/remote/repos/remote_example_repo.dart' as _i8;
import '../../data/repos/example_repo.dart' as _i5;
import '../../modules/detail/controllers/detail_controller.dart' as _i3;
import '../../modules/home/controllers/home_controller.dart' as _i11;
import '../../services/example_service.dart' as _i9;
import '../../services/firebase_remote_config_service.dart' as _i10;
import '../../services/notification_service.dart' as _i14;
import '../network/network_info.dart' as _i6;
import 'register_module.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.DetailController>(() => _i3.DetailController());
  gh.lazySingleton<_i4.Dio>(() => registerModule.dio());
  gh.factory<_i5.ExampleRepo>(() => _i5.ExampleRepoImpl(
      networkInfo: get<_i6.NetworkInfo>(),
      localExampleRepo: get<_i7.LocalExampleRepo>(),
      remoteExampleRepo: get<_i8.RemoteExampleRepo>()));
  gh.lazySingleton<_i9.ExampleService>(() => _i9.ExampleService());
  gh.lazySingleton<_i10.FirebaseRemoteConfigService>(() =>
      _i10.FirebaseRemoteConfigService(
          networkInfo: get<_i6.NetworkInfo>(), dio: get<_i4.Dio>()));
  gh.factory<_i11.HomeController>(() => _i11.HomeController());
  gh.factory<_i7.LocalExampleRepo>(
      () => _i7.LocalExampleRepoImpl(prefs: get<_i12.SharedPreferences>()));
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(connectivity: get<_i13.Connectivity>()));
  gh.lazySingleton<_i14.NotificationService>(() => _i14.NotificationService());
  gh.factory<_i8.RemoteExampleRepo>(
      () => _i8.RemoteExampleRepoImpl(get<_i4.Dio>()));
  await gh.factoryAsync<_i12.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.singleton<_i13.Connectivity>(registerModule.connectivity);
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {
  @override
  _i13.Connectivity get connectivity => _i13.Connectivity();
}
