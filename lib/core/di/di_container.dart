import 'package:get_it/get_it.dart';
import 'package:imdb_flutter/core/di/di_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> initDI() async{
  getIt.init();
  await getIt.allReady();
}
