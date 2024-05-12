import 'dart:async';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
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
        decoration: BoxDecoration(
          color: loadingBackgroundColor,
          //image: DecorationImage(image: AssetImage('assets/images/loading_background.png'), repeat: ImageRepeat.repeat, scale: 2.5, opacity:0.2)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "베이커리타임",
              style:
                  TextStyle(
                    fontFamily: "euljiro",
                    color: textWhiteColor,
                    fontSize: 40,
                ),
            ),
            Text(
              "시간을 굽다",
              style:
                  TextStyle(
                    fontFamily: "euljiro",
                    color: textWhiteColor,
                    fontSize: 20,
                ),
            ),
          ],
        ),
      ));
  }
}
