import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

Drawer mainDrawerWidget() {
  return Drawer(
    backgroundColor: colorPrimaryWhite,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: const CircleAvatar(
            //backgroundImage: AssetImage('assets/me.png'),
            backgroundColor: colorPrimaryWhite,
          ),
          accountName: const Text('Mei'),
          accountEmail: const Text('meibin@aaaa.com'),
          onDetailsPressed: () {
            print('arrow is clicked');
          },
          decoration: const BoxDecoration(
              color: colorPrimary600,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              )),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.grey[850],
          ),
          title: const Text('홈'),
          onTap: () {
            print('Home is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.grey[850],
          ),
          title: const Text('상점'),
          onTap: () {
            print('Setting is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.grey[850],
          ),
          title: const Text('둘러보기'),
          onTap: () {
            print('Setting is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.grey[850],
          ),
          title: const Text('우리의 활동'),
          onTap: () {
            print('Setting is clicked !');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            color: Colors.grey[850],
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
