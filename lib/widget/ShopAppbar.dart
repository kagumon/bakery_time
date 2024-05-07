import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

AppBar cashAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: shopAppBarColor,
    iconTheme: IconThemeData(color: mainAppBarIconColor),
    centerTitle: true,
    elevation: 0.0,
    actions: [
      widthSizeBox(15)
    ],
  );
}
