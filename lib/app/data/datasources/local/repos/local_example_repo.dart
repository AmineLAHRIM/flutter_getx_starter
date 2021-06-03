import 'package:flutter_getx_starter/app/data/models/example.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalExampleRepo {
  Future<bool> cacheExamples(List<Example> events);
}

@Injectable(as: LocalExampleRepo)
class LocalExampleRepoImpl implements LocalExampleRepo {
  SharedPreferences? prefs;

  LocalExampleRepoImpl({this.prefs});

  @override
  Future<bool> cacheExamples(List<Example> events) {
    // TODO: implement cacheExamples
    throw UnimplementedError();
  }
}
