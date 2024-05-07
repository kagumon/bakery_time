import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

AppBar mainAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: colorPrimary800,
    iconTheme: const IconThemeData(color: colorPrimaryWhite),
    centerTitle: true,
    elevation: 0.0,
    actions: [
      IconButton(
        icon: const Icon(Icons.store),
        onPressed: () {
          Navigator.of(context).pushNamed('/shop');
        },
      ),
      IconButton(
        icon: const Icon(Icons.dashboard),
        onPressed: () {
          Navigator.of(context).pushNamed('/record');
        },
      ),
      widthSizeBox(15)
    ],
  );
}
