import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:golf/app/app.module.dart';
import 'package:golf/config/application.dart';
import 'package:golf/themes/styles.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // LoginCubit _cubit = LoginCubit(AuthenticationService());

  Future<Timer> startTime() async => Timer(Duration(seconds: 3), navigationPage);

  void navigationPage() => Modular.to.pushReplacementNamed(AppModule.login);

  @override
  void initState() {
    super.initState();
    Application.sharePreference.putString("locale", I18n.localeStr);
    // if (Application.sharePreference!.hasKey("saveAndValidateData")) {
    //   var data = json.decode(Application.sharePreference!.getString("saveAndValidateData")!);
    //   _login(data as Map<String, dynamic>);
    // } else {
    //   startTime();
    // }
    startTime();
  }

  // Future<void> _login(Map<String, dynamic> params) async {
  //   await _cubit.login(params)
  //       ? Modular.to.pushReplacementNamed(AppModule.home)
  //       : {
  //     startTime(),
  //     Application.sharePreference!.clear(),
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.png', height: 35.h)),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SpinKitThreeBounce(color: AppColor.themeColor, size: 20),
          )
        ],
      ),
    );
  }
}
