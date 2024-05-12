import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer mainDrawerWidget(BuildContext context) {
  return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18),
            decoration: BoxDecoration(
              color: appbarBackgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    widthSizeBox(8),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      child: Image.asset(
                        'assets/images/timer_background.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover
                      ),
                    ),
                    widthSizeBox(8),
                    const Text("kmnk\nkyung2687@gmail.com", style: TextStyle(color: Colors.white, fontSize: 11),),
                    emptyExpanded(),
                    GestureDetector(
                      onTap: () => {
                        logout(),
                        Navigator.of(context).pushNamedAndRemoveUntil("/loading", (route) => false)
                      },
                      child: const Icon(Icons.logout, color: Colors.white,)
                    ),
                    widthSizeBox(8),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("100", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Text("누적 시간", style: TextStyle(fontSize: 12, color: Colors.white),),
                        ],
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("100", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Text("만든 케이크", style: TextStyle(fontSize: 12, color: Colors.white),),
                        ],
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("1k", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Text("총 기부", style: TextStyle(fontSize: 12, color: Colors.white),),
                        ],
                      )
                    ),
                  ],
                ),
              ],
            )
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: iconBlackColor,
            ),
            title: const Text('홈'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: iconBlackColor,
            ),
            title: const Text('상점'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: iconBlackColor,
            ),
            title: const Text('둘러보기'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: iconBlackColor,
            ),
            title: const Text('우리의 활동'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: iconBlackColor,
            ),
            title: const Text('라이선스 정보'),
            onTap: () {
            },
            trailing: const Icon(Icons.check),
          ),
        ],
      ));
}

Future<void> logout() async {
  late final SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setBool("loginStatus", false);
  return;
}