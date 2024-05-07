import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

AppBar cashAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: colorPrimary800,
    iconTheme: const IconThemeData(color: colorPrimaryWhite),
    centerTitle: true,
    elevation: 0.0,
    actions: [
      widthSizeBox(15)
    ],
  );
}
