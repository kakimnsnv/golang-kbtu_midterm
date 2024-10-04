import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/core/user_session.dart';

class RoutingMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RoutingMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    final UserSession userSession = GetIt.I.get<UserSession>();

    if (userSession.isFirstTimeVar.value) return null;
    if (userSession.isAuthenticated.value) return const RouteSettings(name: '/');
    return const RouteSettings(name: '/auth');
  }
}
