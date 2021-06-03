import 'package:equatable/equatable.dart';

/*
* this is simple Example Model extend Equatble to verify (equality objects == not by Reference but with props)
* */
class Example extends Equatable{
  int? id;
  String? name;

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];

}