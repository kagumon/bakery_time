import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

AppBar mainAppBarWidget() {
  return AppBar(
    backgroundColor: colorPrimary800,
    iconTheme: const IconThemeData(color: colorPrimaryWhite),
    centerTitle: true,
    elevation: 0.0,
    //leading: IconButton(
    //  icon: const Icon(Icons.menu),
    //  onPressed: () {
    //    print('menu button is clicked !');
    //   },
    //),
    actions: [
      IconButton(
        icon: const Icon(Icons.store),
        onPressed: () {
          print('home button is clicked !');
        },
      ),
      IconButton(
        icon: const Icon(Icons.dashboard),
        onPressed: () {
          print('search button is clicked !');
        },
      ),
      widthSizeBox(15)
    ],
  );
}
