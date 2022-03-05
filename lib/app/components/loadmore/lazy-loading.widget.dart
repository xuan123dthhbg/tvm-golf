import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../themes/styles.dart';

class LazyLoading extends StatefulWidget {
  final Future<void> Function()? onRefresh;
  final Function()? onLoadmore;
  final Widget? topWidget;
  final double bottomSpacing;
  final bool topWidgetAlwaysOnTop;
  final List<Widget>? children;
  final String? emptyText;
  final bool? setLoadmore;

  const LazyLoading(
      {Key? key,
        this.onRefresh,
        this.topWidget,
        this.onLoadmore,
        this.setLoadmore,
        this.children,
        this.bottomSpacing = 0,
        this.emptyText,
        this.topWidgetAlwaysOnTop = false})
      : super(key: key);

  @override
  _LazyLoadingState createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {
  ScrollController? controller;
  bool loadmore = true;
  int currentChildren = 0;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minVerticalPadding: 0,
        horizontalTitleGap: 0,
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.only(bottom: widget.bottomSpacing),
        title: (widget.topWidgetAlwaysOnTop) ? widget.topWidget : SizedBox(),
        subtitle: RefreshIndicator(
          onRefresh: widget.onRefresh!,
          child: Scrollbar(
            isAlwaysShown: false,
            child: ListView.builder(
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? (widget.topWidgetAlwaysOnTop)
                    ? SizedBox()
                    : widget.topWidget!
                    : index == widget.children!.length + (widget.topWidget != null ? 1 : 0)
                    ? widget.setLoadmore!
                    ? Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(AppColor.themeColor))))
                    : widget.children!.isEmpty
                    ? Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                        child: Text(
                          widget.emptyText ?? "Không có dữ liệu để hiển thị",
                          style: TextStyle(color: AppColor.regularText, fontSize: 11.0.sp),
                        )))
                    : SizedBox()
                    : widget.children![index - (widget.topWidget != null ? 1 : 0)];
              },
              itemCount: widget.children!.length +
                  (widget.topWidget != null
                      ? (widget.topWidgetAlwaysOnTop)
                      ? 1
                      : 2
                      : 1),
            ),
          ),
        ));
  }

  void _scrollListener() {
    if (controller!.position.extentAfter == 0 && loadmore) {
      if (!widget.setLoadmore!) {
        if (currentChildren == widget.children!.length || widget.children!.length < 10) {
          loadmore = false;
        } else {
          widget.onLoadmore!();
          currentChildren = widget.children!.length;
          loadmore = true;
        }
      }
    }
  }
}
