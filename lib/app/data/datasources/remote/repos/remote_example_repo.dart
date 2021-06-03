import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_getx_starter/app/core/error/exceptions.dart';
import 'package:flutter_getx_starter/app/data/datasources/remote/error/remote_message_error.dart';
import 'package:flutter_getx_starter/app/data/models/example.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteExampleRepo {
  Future<Example> findById({
    required int eventId,
    required String accessToken,
  });
}

@Injectable(as: RemoteExampleRepo)
class RemoteExampleRepoImpl implements RemoteExampleRepo {
  Dio? dio;

  RemoteExampleRepoImpl(this.dio);

  @override
  Future<Example> findById({required int eventId, required String accessToken}) async {
    // TODO: implement findById
    try {
      print('[track event findById] SENT');

      final response = await dio!.get('/user/event/$eventId/', options: Options(headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'}));
      print('[track event findById] RECIVED ${response.statusCode}');

      // as Map<String,dynamic> not json string as response.body of http package
      final responseData = response.data;

      if (response.statusCode == 200) {
        final event = Example.fromJson(responseData);
        return event;
      } else {
        throw DioError(response: response, requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      //possible errors
      List<RemoteMessageError> rmerrors = [
        RemoteMessageError(code: 4, message: 'Error of code 4'),
      ];
      throw RemoteException(e: e, rmerrors: rmerrors);
    }
  }
}
