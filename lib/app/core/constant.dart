import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class Constant {
  Constant();

  // REST API CONFIG
  static var HOST_URL = 'URL_HERE';

  static String get REMOTE_URL => HOST_URL + '/api';

  static final DateFormat backendDateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

  // or new Dio with a BaseOptions instance.
  static final BaseOptions options = new BaseOptions(
    baseUrl: REMOTE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
}
