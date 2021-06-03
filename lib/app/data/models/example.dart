import 'package:equatable/equatable.dart';
import 'package:flutter_getx_starter/app/data/utils/dateconverter.dart';

/*
* this is simple Example Model extend Equatble to verify (equality objects == not by Reference but with props)
* */
class Example extends Equatable {
  int? id;
  String? name;
  DateTime? createdAt;

  Example({this.id, this.name, this.createdAt});

  Example.fromJson(Map<String, dynamic> json, {bool isUtc = true, DateFormatSource? dateFormatSource}) {
    id = json['id'];
    name = json['name'];
    createdAt = DateConverter.fromJson(jsonDateString: json['created_at'], isUtc: isUtc, dateFormatSource: dateFormatSource);
  }

  Map<String, dynamic> toJson({bool isUtc = true, DateFormatSource? dateFormatSource}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = DateConverter.toJson(date: this.createdAt, isUtc: isUtc, dateFormatSource: dateFormatSource);

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
