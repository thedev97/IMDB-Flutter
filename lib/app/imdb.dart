import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imdb_flutter/app/navigation/app_route_config.dart';
import 'package:imdb_localization/strings.g.dart';

class IMDBApp extends StatefulWidget {
  const IMDBApp({super.key});

  @override
  State<IMDBApp> createState() => _IMDBAppState();
}

class _IMDBAppState extends State<IMDBApp> {
  final _appRouteConfig = AppRouteConfig();

  @override
  void dispose() {
    _appRouteConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouteConfig.router,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}

