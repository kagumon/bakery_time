import 'package:flutter/material.dart';

AppBar mainAppBarWidget() {
  return AppBar(
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
        icon: const Icon(Icons.home),
        onPressed: () {
          print('home button is clicked !');
        },
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          print('search button is clicked !');
        },
      ),
    ],
  );
}
