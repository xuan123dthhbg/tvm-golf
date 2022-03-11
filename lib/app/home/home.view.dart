import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golf/app/home/home.cubit.dart';
import 'package:golf/config/application.dart';
import 'package:golf/resources/default.i18n.dart';
import 'package:golf/themes/styles.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> mainModules = [];
  int _bottomNavIndex = 0;

  bool get onWillPop => false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Application.sharePreference.putInt("NavIndex", 0);
    mainModules = [
      {
        'tab': 'home',
        'label': 'Home',
        'widget': Container(),
      },
      {
        'tab': 'extension',
        'label': 'Extension',
        // 'widget': Extension(connection: Application.connection),
        'widget': Container()
      },
      {
        'tab': 'noti',
        'label': 'Notifications',
        // 'widget': NotificationView(connection: Application.connection),
        'widget': Container()
      },
      {
        'tab': 'profile',
        'label': 'Profile',
        // 'widget': Profile(isFromBottomNavigationBar: true,),
        'widget': Container()
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        // floatingActionButton: SizedBox(
        //   width: 10.h,
        //   height: 10.h,
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       setState(() {
        //         _bottomNavIndex = 4;
        //       });
        //     },
        //     backgroundColor: Colors.white60,
        //     elevation: 1,
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         Container(
        //           margin: EdgeInsets.all(6),
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF00B59C), Color(0xFF19769F)]),
        //           ),
        //         ),
        //         SvgPicture.asset("assets/images/booking-sub-icon.svg", height: 6.5.h)
        //       ],
        //     ),
        //   ),
        // ),
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (prev, now) => now is HavingNotification,
          bloc: Application.homeCubit,
          builder: (context, state) => BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...List.generate(
                        4,
                        (index) => Row(
                          children: [
                            InkWell(
                              onTap: () => setState(() {
                                Application.sharePreference.putInt("NavIndex", index);
                                _bottomNavIndex = index;
                                index == 2 ? Application.countNotifications = 0 : null;
                              }),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                height: 8.h,
                                width: 92.w / 4,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            'assets/images/icon/${mainModules[index]["tab"]}.svg',
                                            height: 3.h,
                                            color: _bottomNavIndex == index ? Color(0xFF00B59C) : AppColor.regularText,
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Text(
                                          "${mainModules[index]["label"]}".i18n,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: _bottomNavIndex == index ? Color(0xFF00B59C) : AppColor.regularText,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    index != 2
                                        ? SizedBox()
                                        : Application.countNotifications != 0
                                            ? Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  margin: EdgeInsets.only(right: 5.w, top: 3),
                                                  // padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  alignment: Alignment.center,
                                                  height: 4.w,
                                                  width: 4.w,
                                                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                                  child: Text(
                                                    "${Application.countNotifications}",
                                                    style: TextStyle(color: Colors.white, fontSize: 2.5.w),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                            // index == 1 ? SizedBox(width: 100.w / 4) : SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(bottom: 11),
                  //     child: Text(
                  //       'Booking'.i18n,
                  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        body: PageTransitionSwitcher(
          transitionBuilder: (Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
            );
          },
          child: mainModules[_bottomNavIndex]['widget'] as Widget,
        ),
        extendBody: true,
      ),
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    actionsPadding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 2.0.h),
                    contentPadding: EdgeInsets.all(5.0.w),
                    title: Text('Are you sure you want to quit?'.i18n,
                        textAlign: TextAlign.center, style: TextStyle(color: AppColor.regularText, fontWeight: FontWeight.w600, fontSize: 13.0.sp)),
                    actions: <Widget>[
                      GestureDetector(
                          child: Text('Quit'.i18n, style: TextStyle(color: AppColor.themeColor, fontWeight: FontWeight.w600, fontSize: 11.0.sp)),
                          onTap: () {
                            exit(0);
                          }),
                      SizedBox(width: 3.0.w),
                      GestureDetector(
                          child: Text(
                            'Cancel'.i18n,
                            style: TextStyle(color: AppColor.regularText, fontSize: 10.sp),
                          ),
                          onTap: () => Navigator.pop(context)),
                    ]));
        return false;
      },
    );
  }
}
