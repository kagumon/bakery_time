import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer mainDrawerWidget(BuildContext context) {
  late final SharedPreferences _prefs;

  return Drawer(
      backgroundColor: draw0001,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18),
            decoration: BoxDecoration(
              color: draw0002,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    widthSizeBox(8),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: Image.asset(
                        'assets/images/timer_background.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover
                      ),
                    ),
                    widthSizeBox(8),
                    Text("kmnk\nkyung2687@gmail.com", style: TextStyle(color: Colors.white, fontSize: 11),),
                    emptyExpanded(),
                    GestureDetector(
                      onTap: () async => {
                        _prefs = await SharedPreferences.getInstance(),
                        _prefs.setBool("loginStatus", false),
                        Navigator.of(context).pushNamedAndRemoveUntil("/loading", (route) => false)
                      },
                      child: Icon(Icons.logout, color: Colors.white,)
                    ),
                    widthSizeBox(8),
                  ],
                ),
                Row(
                  children: [
                    totalTextContainer("누적 시간", 100),
                    totalTextContainer("오늘 시간", 100),
                    totalTextContainer("만든 케이크", 100),
                  ],
                ),
              ],
            )
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: draw0004,
            ),
            title: const Text('홈'),
            onTap: () {
              print('Home is clicked !');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: draw0004,
            ),
            title: const Text('상점'),
            onTap: () {
              print('Setting is clicked !');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: draw0004,
            ),
            title: const Text('둘러보기'),
            onTap: () {
              print('Setting is clicked !');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: draw0004,
            ),
            title: const Text('우리의 활동'),
            onTap: () {
              print('Setting is clicked !');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: draw0004,
            ),
            title: const Text('라이선스 정보'),
            onTap: () {
              print('Q&A is clicked !');
            },
            trailing: const Icon(Icons.check),
          ),
        ],
      ));
}

Expanded totalTextContainer(String title, int value) {
  return Expanded(
    child: Column(
      children: [
        Text("$value", style: TextStyle(fontSize: 30, color: Colors.white),),
        Text("$title", style: TextStyle(fontSize: 12, color: Colors.white),),
      ],
    )
  );
}