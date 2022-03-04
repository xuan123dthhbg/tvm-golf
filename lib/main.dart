import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:golf/app/app.module.dart';
import 'package:golf/app/app.view.dart';
import 'package:golf/config/application.dart';
import 'package:golf/utils/share_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color.fromRGBO(0, 181, 156, 1),
    ),
  );
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]),
  ]);
  Application.sharePreference = await SpUtil.getInstance();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
