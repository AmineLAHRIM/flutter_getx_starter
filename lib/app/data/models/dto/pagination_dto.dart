import 'package:equatable/equatable.dart';
import 'package:flutter_getx_starter/app/core/constant.dart';

class PaginationDto extends Equatable {
  int page;
  int pageSize;

  PaginationDto({
    this.page = 1,
    this.pageSize = Constant.LIST_PAGE_SIZE,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        page,
        pageSize,
      ];

  @override
  bool get stringify {
    return true;
  }
}
