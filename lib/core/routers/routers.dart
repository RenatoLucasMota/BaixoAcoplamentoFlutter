import 'package:flutter/material.dart';
import 'package:melhores_praticas/features/category/repository/category_repository.dart';
import 'package:melhores_praticas/features/category/router/category_router.dart';

class Routers {
  static String get initialRoute => '/';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/': (_, args) => CategoryRouter(
      repository: CategoryRepository(),
    ),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
