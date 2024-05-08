import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

AppBar mainAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: main0002,
    iconTheme: IconThemeData(color: main0003),
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
