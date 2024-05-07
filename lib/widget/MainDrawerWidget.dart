import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

Drawer mainDrawerWidget(BuildContext context) {
  return Drawer(
    backgroundColor: drawerBackgroundColor,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            //backgroundImage: AssetImage('assets/me.png'),
            backgroundColor: drawerAvatarBackgroundColor,
          ),
          accountName: const Text('Mei'),
          accountEmail: const Text('meibin@aaaa.com'),
          onDetailsPressed: () {
            print('arrow is clicked');
          },
          decoration: BoxDecoration(color: drawerHeaderBackgroundColor,),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: drawerListIconColor,
          ),
          title: const Text('홈'),
          onTap: () {
            print('Home is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: drawerListIconColor,
          ),
          title: const Text('상점'),
          onTap: () {
            print('Setting is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: drawerListIconColor,
          ),
          title: const Text('둘러보기'),
          onTap: () {
            print('Setting is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: drawerListIconColor,
          ),
          title: const Text('우리의 활동'),
          onTap: () {
            print('Setting is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            color: drawerListIconColor,
          ),
          title: const Text('라이선스 정보'),
          onTap: () {
            print('Q&A is clicked !');
          },
          trailing: const Icon(Icons.check),
        ),
      ],
    )
  );
}
