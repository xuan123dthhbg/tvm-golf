import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'booking.view.dart';

class BookingModule extends Module {
  // static String bookingField = '/bookingField';
  // static String bookingFilter = '/bookingFilter';
  // static String bookingTransaction = '/bookingTransaction';
  // static String bookingSearchView = '/bookingSearchView';

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => BookingView()),
  ];

  @override
  Widget get view => BookingView();
}
