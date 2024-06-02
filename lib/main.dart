import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_flutter/core/di/di_container.dart';
import 'package:imdb_flutter/app/imdb.dart';
import 'package:imdb_localization/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDi();
  return runApp(TranslationProvider(child: const IMDBApp()));
}
