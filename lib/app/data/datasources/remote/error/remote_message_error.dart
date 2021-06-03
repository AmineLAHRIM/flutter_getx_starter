import 'package:equatable/equatable.dart';

class RemoteMessageError extends Equatable {
  String? message;
  int? code;

  RemoteMessageError({this.message, this.code});

  RemoteMessageError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [message, code];
}
