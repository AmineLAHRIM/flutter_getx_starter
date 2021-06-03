/*
* Here All App Routes
* */
import 'package:equatable/equatable.dart';
import 'package:flutter_getx_starter/app/routes/app_pages.dart';

class NotificationRoute extends Equatable {
  String? page;
  int? id;

  NotificationRoute({this.page, this.id});

  static const HOME = 'home_id';

  static Map<String?, String> routes = {
    HOME: Routes.HOME,
  };

  static String? getPage({String? route}) {
    // route is EVENT for example
    if (routes.containsKey(route)) {
      return routes[route];
    } else {
      return null;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [page, id];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}
