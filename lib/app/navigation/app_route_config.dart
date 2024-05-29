import 'package:go_router/go_router.dart';
import 'package:imdb_flutter/app/navigation/app_route.dart';
import 'package:imdb_flutter/app/ui/screens/splash/splash.dart';
import 'package:imdb_flutter/app/ui/screens/splash/splash_view_model.dart';

class AppRouteConfig {
  late final GoRouter router = GoRouter(routes: _routes);

  void dispose(){}

  late final _routes = <RouteBase>[
    GoRoute(
        path: '/',
        name: AppRoute.root,
        builder: (context, state) {
          return Splash(splashViewModel: SplashViewModel());
        })
  ];
}
