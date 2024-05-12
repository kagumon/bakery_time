import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

AppBar cashAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: appbarBackgroundColor,
    iconTheme: IconThemeData(color: iconWhiteColor),
    centerTitle: true,
    elevation: 0.0,
    actions: [widthSizeBox(15)],
  );
}
