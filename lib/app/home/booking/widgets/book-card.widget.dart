import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class BookingCardWidget extends StatelessWidget {
  final bool hasDiscount;
  final bool isFavorite;
  final double distance;

  const BookingCardWidget({required this.distance, required this.hasDiscount, required this.isFavorite, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 90.w,
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/graphic/booking/cover.png",
              fit: BoxFit.cover,
            ),
          ),
          if (hasDiscount)
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Align(alignment: Alignment.topLeft, child: SvgPicture.asset("assets/images/graphic/booking/voucher.svg")),
            ),
          Padding(
            padding: EdgeInsets.only(right: 4.w, top: 2.w),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                "assets/images/graphic/booking/favorite.svg",
                color: (isFavorite) ? Colors.red : Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [

              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
