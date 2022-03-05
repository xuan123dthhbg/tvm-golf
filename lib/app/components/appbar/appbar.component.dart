import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

PreferredSizeWidget staticAppbar(BuildContext context,
    {double? height,
      Widget? title,
      List<Widget>? actions,
      Widget? leading,
      PreferredSizeWidget? bottomWidget,
      double? titleSpacing,
      bool automaticallyImplyLeading = true,
      bool? centerTitle}) =>
    AppBar(
      toolbarHeight: height,
      backgroundColor: Colors.transparent,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading == null && automaticallyImplyLeading
          ? IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined),
        onPressed: () {
          Modular.to.pop();
          FocusScope.of(context).unfocus();
        },
      )
          : leading,
      bottom: bottomWidget,
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF00B59C), Color(0xFF056F83)]),
        ),
      ),
    );
