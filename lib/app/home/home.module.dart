import 'package:flutter_modular/flutter_modular.dart';
import 'package:golf/app/home/home.view.dart';

class HomeModule extends Module {
  // static String newsFeed = '/newsFeed';
  // static String extension = '/extension';
  // static String booking = "/booking";
  // static String profile = "/profile";
  // static String notification = "/notification";
  // static String messenger = "/messenger";

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => Home()),
    // ModuleRoute(profile, module: ProfileModule()),
    // ModuleRoute(booking, module: BookingModule()),
    // ModuleRoute(newsFeed, module: NewsFeedModule()),
    // ModuleRoute(extension, module: ExtensionModule()),
    // ModuleRoute(notification, module: NotificationModule()),
  ];
}
