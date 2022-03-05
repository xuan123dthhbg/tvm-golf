import 'package:flutter_modular/flutter_modular.dart';
import 'package:golf/app/login/login.view.dart';
import 'package:golf/app/register/register.view.dart';
import 'package:golf/app/splash-screen/splash_screen.view.dart';

import 'home/home.view.dart';
class AppModule extends Module {
  static String home = "/home";
  static String login = "/login";
  static String splashScreen = "/";
  static String register = "/register";

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    // ModuleRoute('/home', module: HomeModule(), transition: TransitionType.rightToLeftWithFade),
    ChildRoute(splashScreen, child: (context, args) => SplashScreen()),
    ChildRoute(login, child: (context, args) => LoginView(), transition: TransitionType.downToUp),
    ChildRoute(register, child: (context, args) => RegisterView(), transition: TransitionType.leftToRight),
    ChildRoute(home, child: (context, args) => HomeWidget(), transition: TransitionType.leftToRight),
  ];
}
