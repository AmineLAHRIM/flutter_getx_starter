import 'package:equatable/equatable.dart';

class Pagination<T> extends Equatable {
  List<T>? list;
  int? total;

  Pagination({this.list, this.total});

  @override
  // TODO: implement props
  List<Object?> get props => [list, total];
}
