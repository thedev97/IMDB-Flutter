import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb_flutter/app/navigation/app_route.dart';
import 'package:imdb_flutter/app/ui/screens/main/main_screen.dart';
import 'package:imdb_flutter/app/ui/screens/splash/splash.dart';
import 'package:imdb_flutter/app/ui/screens/splash/splash_view_model.dart';
import 'package:imdb_flutter/core/di/inject.dart';
import 'package:imdb_flutter/domain/bloc/home_bloc.dart';

class AppRouteConfig {
  late final GoRouter router = GoRouter(routes: _routes);

  void dispose(){}

  late final _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) => Splash(
        splashViewModel: SplashViewModel(),
      ),
    ),
    GoRoute(
      path: '/main',
      name: AppRoute.main,
      builder: (context, state) => BlocProvider(
        create: (_) => HomeBloc(inject()),
        child: const IMDBMain(),
      ),
    ),
  ];
}
