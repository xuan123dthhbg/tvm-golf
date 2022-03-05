import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

void showCustomDialog(BuildContext context, {bool successIcon = false, Widget? child, EdgeInsets? insetPadding, EdgeInsets? padding, double? width}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: insetPadding,
          child: Container(
            constraints: BoxConstraints(maxWidth: width ?? 60.0.w),
            padding: padding ?? EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 6.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (successIcon)
                  SvgPicture.asset(
                    "assets/images/extension/successIcon.svg",
                    height: 18.0.w,
                  ),
                if (child != null) child,
              ],
            ),
          ));
    },
  );
}
