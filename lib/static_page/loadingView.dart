import 'dart:async';

import 'package:bakery_time/model/loginUser.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  late final SharedPreferences _prefs;
  bool? _loginStatus = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      _initSharedPreferences().then((value) => _loadData());
    });
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
 
  Future<void> _loadData() async {
    _loginStatus = _prefs.getBool("loginStatus");
    if(_loginStatus == null || _loginStatus == false) {
      Navigator.of(context).pushNamedAndRemoveUntil("/enter", (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: load0001,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "베이커리타임",
              style:
                  TextStyle(fontFamily: "euljiro", color: comm0001, fontSize: 40),
            ),
            Text(
              "시간을 굽다.",
              style:
                  TextStyle(fontFamily: "euljiro", color: comm0001, fontSize: 30),
            ),
          ],
        ),
      ));
  }
}
