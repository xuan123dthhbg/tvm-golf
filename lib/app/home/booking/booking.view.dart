import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golf/app/home/booking/widgets/book-card.widget.dart';
import 'package:golf/resources/default.i18n.dart';
import 'package:golf/themes/styles.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class BookingView extends StatefulWidget {
  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  // BookingCubit _bookingCubit = BookingCubit();
  final _selection = ["Discount", "Favorite", "Nearest", "Optional"];

  var _scrollController = ScrollController();
  late double _opacity;
  double? _top;
  late bool _disabled;

  @override
  void initState() {
    super.initState();
    _opacity = 1;
    _top = 40.h * _opacity / 2;
    _disabled = false;
    // _bookingCubit.getProductLocation();
    _scrollController.addListener(() {
      setState(() {
        _opacity = 1 - min(1.0, _scrollController.offset / 100) as double;
        _top = 40.h * _opacity / 2 - _scrollController.offset;
        if (_opacity < 1) {
          _disabled = true;
        } else {
          _disabled = false;
        }
      });
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _bookingCubit.loadMoreProduct();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<BookingCubit, BookingState>(
    //     buildWhen: (prev, now) => now is Loading || now is Loaded,
    //     bloc: _bookingCubit,
    //     builder: (context, state) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 100.w,
            height: 11.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF00B59C), Color(0xFF19769F)],
              ),
            ),
          ),
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                collapsedHeight: 15.h,
                expandedHeight: 20.h,
                floating: true,
                pinned: true,
                forceElevated: true,
                title: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // _buildSearchBar(),
                      Container(
                        height: 10.h,
                        width: 77.w,
                        color: Colors.red,
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: SvgPicture.asset("assets/images/booking/icon-hamburger.svg", width: 3.h, height: 4.h),
                        // onPressed: () => Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.bookingTransaction),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/graphic/booking/cover.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedOpacity(
                    child: Container(
                      height: 11.h,
                      color: Colors.white,
                    ),
                    opacity: _opacity,
                    duration: Duration.zero,
                    curve: Curves.easeOutCirc,
                  ),
                  Column(
                    children: List.generate(
                      10,
                      (index) => BookingCardWidget(
                        distance: 230,
                        hasDiscount: true,
                        isFavorite: true,
                      ),
                    ),
                  )
                  // SingleChildScrollView(
                  //   child: Container(
                  //     color: Colors.white,
                  //     child: (state is Loaded)
                  //         ? _buildSuggestionList()
                  //         : (state is Loading)
                  //             ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColor.themeColor)))
                  //             : Padding(
                  //                 padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 10),
                  //                 child: Center(child: Text('No connection!')),
                  //               ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration.zero,
            top: _top,
            left: 4.w,
            right: 4.w,
            child: AnimatedOpacity(
              duration: Duration.zero,
              opacity: _opacity,
              child: _buildSelection(),
            ),
          ),
        ],
      ),
    );
    // });
  }

  // Widget _buildSearchBar() => Container(
  //       height: 40,
  //       width: 77.w,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(color: Color.fromRGBO(218, 218, 218, 1)),
  //           color: Color.fromRGBO(0, 0, 0, 0.2)),
  //       child: FormBuilderTextField(
  //         readOnly: true,
  //         showCursor: true,
  //         // onTap: () => Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.bookingSearchView),
  //         name: "search",
  //         style: TextStyle(color: Colors.white),
  //         decoration: InputDecoration(
  //           hintText: "Find place".i18n,
  //           hintStyle: TextStyle(color: Colors.white, fontSize: 14),
  //           border: OutlineInputBorder(borderSide: BorderSide.none),
  //           contentPadding: EdgeInsets.zero,
  //           prefixIcon: Container(
  //             child: SvgPicture.asset("assets/images/booking/icon-search.svg"),
  //             margin: EdgeInsets.symmetric(horizontal: 4.w),
  //           ),
  //         ),
  //       ),
  //     );
//
  Widget _buildSelection() => Container(
        height: 11.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < _selection.length; i++)
              Expanded(
                child: TextButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/images/graphic/booking/${_selection[i].toLowerCase()}.svg"),
                      Text(
                        "${_selection[i].i18n}",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.regularText),
                      )
                    ],
                  ),
                  onPressed: () {},
                  // onPressed: _disabled
                  //     ? null
                  //     : () => {
                  //           Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.bookingFilter, arguments: i + 1),
                  //         },
                ),
              )
          ],
        ),
      );

//   Widget _buildSuggestionList() => Padding(
//         padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(bottom: 10, top: 10, left: 4.w, right: 4.w),
//               child: Text(
//                 "Suggestion".i18n,
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             ...List.generate(
//                 // _bookingCubit.bookingList.length,
//               // mock
//               5,
//                 (index) => Container(
//                     margin: EdgeInsets.only(bottom: 4.w),
//                     child: InkWell(
//                       // onTap: () =>
//                       //     _bookingCubit.transition(_bookingCubit.bookingList[index].id, _bookingCubit.bookingList[index].name, _bookingCubit),
//                       onTap: (){},
//                       child: Container(
//                         height: 22.h,
//                         decoration:
//                             BoxDecoration(image: DecorationImage(image: ExactAssetImage("assets/images/booking/sample.png"), fit: BoxFit.cover)),
//                         child: Stack(
//                           children: [
//                             BlocBuilder<BookingCubit, BookingState>(
//                               buildWhen: (prev, now) => now is LikeChanged || now is Loaded,
//                               bloc: _bookingCubit,
//                               builder: (context, state) => GestureDetector(
//                                 onTap: () => _bookingCubit.checkLike(_bookingCubit.bookingList[index].id!, index),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   child: Padding(
//                                     padding: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 2, right: SizeConfig.safeBlockHorizontal * 3),
//                                     child: SvgPicture.asset(
//                                         "assets/images/booking/icon-favorite-${_bookingCubit.bookingList[index].isFavorite! ? "red" : "none"}.svg"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 5),
//                               child: Align(
//                                 alignment: Alignment.bottomLeft,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             "${_bookingCubit.bookingList[index].firstTeeTime!.substring(0, _bookingCubit.bookingList[index].firstTeeTime!.lastIndexOf(":"))} - ${_bookingCubit.bookingList[index].lastTeeTime!.substring(0, _bookingCubit.bookingList[index].lastTeeTime!.lastIndexOf(":"))}",
//                                             style: TextStyle(
//                                                 color: Colors.white, fontWeight: FontWeight.w500, fontSize: SizeConfig.safeBlockHorizontal * 3.5),
//                                           ),
//                                           Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: SizeConfig.safeBlockHorizontal *
//                                                       (_bookingCubit.bookingList[index].firstTeeTime != null
//                                                           ? SizeConfig.safeBlockHorizontal * 1.5
//                                                           : 0))),
//                                           Text(
//                                             "${_bookingCubit.bookingList[index].name}",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         _bookingCubit.bookingList[index].promotion == 0 && _bookingCubit.bookingList[index].price != 0
//                                             ? Container(
//                                                 padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3),
//                                                 alignment: Alignment.centerLeft,
//                                                 child: Text(
//                                                   "${NumberFormat.currency(locale: 'vi', symbol: "đ").format(_bookingCubit.bookingList[index].price)}",
//                                                   style: TextStyle(
//                                                       fontSize: SizeConfig.safeBlockHorizontal * 3.5,
//                                                       fontWeight: FontWeight.w400,
//                                                       color: Colors.white),
//                                                 ),
//                                               )
//                                             : Container(),
//                                         Stack(
//                                           alignment: Alignment.centerLeft,
//                                           children: [
//                                             Container(
//                                               height: SizeConfig.safeBlockVertical * 2,
//                                               width: SizeConfig.safeBlockHorizontal * 40,
//                                               decoration: BoxDecoration(
//                                                   gradient: LinearGradient(
//                                                       begin: Alignment.lerp(Alignment.centerLeft, Alignment.center, 1)!,
//                                                       end: Alignment.centerRight,
//                                                       colors: [Colors.red, Colors.transparent])),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3),
// //                              padding: const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   CircleAvatar(
//                                                     maxRadius: SizeConfig.safeBlockHorizontal * 3.2,
//                                                     backgroundColor: Colors.white,
//                                                     child: SvgPicture.asset("assets/images/booking/icon-membership.svg"),
//                                                   ),
//                                                   SizedBox(width: SizeConfig.safeBlockHorizontal * 3),
//                                                   Text(
//                                                     "${"Member price".i18n}: ${NumberFormat.currency(locale: 'vi', symbol: "đ").format((_bookingCubit.bookingList[index].price! * (1 - (_bookingCubit.bookingList[index].promotion! + _bookingCubit.bookingList[index].membershipPromotion!))))}",
//                                                     style: TextStyle(
//                                                       fontWeight: FontWeight.w500,
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     _bookingCubit.bookingList[index].price != 0
//                                         ? Container(
//                                             padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3, top: 3),
//                                             alignment: Alignment.centerLeft,
//                                             child: Text(
//                                               "${NumberFormat.currency(locale: 'vi', symbol: "đ").format(_bookingCubit.bookingList[index].price! * (1 - _bookingCubit.bookingList[index].promotion!))}",
//                                               style: TextStyle(
//                                                   fontSize: SizeConfig.safeBlockHorizontal * 3.5, fontWeight: FontWeight.w400, color: Colors.white),
//                                             ),
//                                           )
//                                         : Container(),
//                                     _bookingCubit.bookingList[index].price != 0 && _bookingCubit.bookingList[index].promotion != 0
//                                         ? Container(
//                                             padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3, top: 3),
//                                             alignment: Alignment.centerLeft,
//                                             child: Text.rich(TextSpan(
//                                               style: TextStyle(
//                                                   fontSize: SizeConfig.safeBlockHorizontal * 3,
//                                                   fontWeight: FontWeight.w400,
//                                                   color: Color(0xFFFCBD0C)),
//                                               children: [
//                                                 TextSpan(
//                                                     text:
//                                                         "${NumberFormat.currency(locale: 'vi', symbol: "đ").format(_bookingCubit.bookingList[index].price)}",
//                                                     style: TextStyle(decoration: TextDecoration.lineThrough)),
//                                                 TextSpan(
//                                                     text:
//                                                         "       ${NumberFormat.currency(symbol: "").format(_bookingCubit.bookingList[index].promotion! * 100)}%"),
//                                               ],
//                                             )))
//                                         : Container()
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 5),
//                               child: Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     RatingBar(
//                                       ignoreGestures: true,
//                                       itemSize: SizeConfig.safeBlockVertical * 1.5,
//                                       initialRating: _bookingCubit.bookingList[index].reviewPoint!,
//                                       direction: Axis.horizontal,
//                                       allowHalfRating: true,
//                                       itemCount: 5,
//                                       ratingWidget: RatingWidget(
//                                         full: SvgPicture.asset("assets/images/booking/icon-star.svg"),
//                                         half: SvgPicture.asset("assets/images/booking/icon-star-half.svg"),
//                                         empty: SvgPicture.asset("assets/images/booking/icon-star-none.svg"),
//                                       ),
//                                       itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
//                                       onRatingUpdate: (rating) {},
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
//                                 child: Stack(alignment: AlignmentDirectional.center, children: [
//                                   SvgPicture.asset("assets/images/booking/ribbon.svg"),
//                                   Padding(
//                                     padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
//                                     child: SvgPicture.asset("assets/images/booking/icon-present.svg"),
//                                   ),
//                                 ]),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ))),
//           ],
//         ),
//       );
}
