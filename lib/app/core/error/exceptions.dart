import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_getx_starter/app/data/datasources/remote/error/remote_message_error.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class HttpException extends Equatable implements Exception {
  final RemoteMessageError remoteMessageError;

  HttpException(this.remoteMessageError);

  @override
  String toString() {
    return remoteMessageError.message!;
  }

  @override
  // TODO: implement props
  List<Object> get props => [remoteMessageError];
}

class TokenException implements Exception {}

/*class StripeCheckoutException extends Equatable implements Exception {
  final StripeMessageError stripeMessageError;

  StripeCheckoutException(this.stripeMessageError);

  @override
  String toString() {
    return stripeMessageError?.error?.message;
  }

  @override
  // TODO: implement props
  List<Object> get props => [stripeMessageError];
}*/

class StripeCheckoutException extends Equatable implements Exception {
  final String message;

  StripeCheckoutException(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

RemoteException(
    {required DioError e,
    List<RemoteMessageError>? rmerrors,
    bool skipTokenException = false}) {
  if (e.error == SocketException) {
    throw SocketException('failure_server');
  }

  final response = e.response;
  if (response?.data == null || response!.statusCode! >= 500) {
    throw ServerException();
  }
  final responseData = response.data;
  if (responseData['code'] != null) {
    var message = responseData['message'];
    if (skipTokenException == false && responseData['code'] == 16) {
      print('[TokenFailure] because of code 16');
      throw TokenException();
    } else {
      var index = rmerrors!
          .indexWhere((element) => responseData['code'] == element.code);
      if (index != -1) message = rmerrors[index].message;
    }
    if (message != null) {
      final remoteMessageError = RemoteMessageError.fromJson(responseData);
      remoteMessageError.message = message;
      throw HttpException(remoteMessageError);
    } else {
      throw ServerException();
    }
  } else {
    throw ServerException();
  }
}
