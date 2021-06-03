import 'package:equatable/equatable.dart';

/*
* this class for transfering data between functions and specialy from UI to Rest API (Data Transfer Object dto)
* */
class ExampleDto extends Equatable{
  int? id;
  String? search;

  @override
  // TODO: implement props
  List<Object?> get props => [id,search];

}