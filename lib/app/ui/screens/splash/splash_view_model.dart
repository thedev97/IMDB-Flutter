import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb_flutter/app/navigation/app_route.dart';

class SplashViewModel{
  void goToHome(BuildContext context){
    context.goNamed(AppRoute.main);
  }
}