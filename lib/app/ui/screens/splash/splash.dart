import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imdb_flutter/app/ui/screens/splash/splash_view_model.dart';
import 'package:imdb_flutter/library/resource/assets.dart';
import 'package:imdb_flutter/library/resource/colors.dart';

class Splash extends StatefulWidget {
  final SplashViewModel splashViewModel;

  const Splash({required this.splashViewModel, super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async{ 
      await Future.delayed(const Duration(seconds: 2));
      if(mounted){
        widget.splashViewModel.goToHome(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(AppIcons.appLogo, height: 200),
      ),
    );
  }
}