import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:golf/config/application.dart';
import 'package:golf/config/locale.dart';
import 'package:golf/utils/api.dart';
import 'package:golf/utils/custom_toast.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    Application.api = API();
    Application.toast = Toastify();
    Application.sharePreference.putString('locale', "vi_vn");
    Intl.defaultLocale = Application.sharePreference.getString('locale');
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Sizer(
        builder: (context, orientation, deviceType) => I18n(
          initialLocale: AppLocale.locales[Application.sharePreference.getString('locale')],
          child: MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocale.locales.values.toList(),
            locale: AppLocale.locales[Application.sharePreference.getString('locale')],
            theme: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              canvasColor: Colors.white,
              fontFamily: "SF",
            ),
            debugShowCheckedModeBanner: false,
          ).modular(),
        ),
      ),
    );
  }
}
