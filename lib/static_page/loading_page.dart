import 'dart:async';
import 'dart:convert';
import 'package:bakery_time/model/bakery_timer_model.dart';
import 'package:bakery_time/model/cake_model.dart';
import 'package:bakery_time/util/pref_handler.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), () {
      final SharedPreferences pref = PreferencesHandler.instance.pref;

      if (pref.getBool("loginStatus") == null ||
          pref.getBool("loginStatus") == false) {
        print("로그인 안되어 있어 로그인 화면으로 이동");
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/enter", (route) => false);
      } else {
        String? data = pref.getString("currentCake");
        if (data == null || data == "") {
          print("플레이 기록이 없어 홈으로 이동");
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/home", (route) => false);
        } else {
          Cake currentCake = Cake.fromJson(jsonDecode(data));
          if (currentCake.currentStatus == 1) {
            BakeryTimer bakeryTimer = BakeryTimer.fromJson(
                jsonDecode(pref.getString("currentTimer")!));
            Duration offlineTime =
                DateTime.now().difference(DateTime.parse(bakeryTimer.lastDTTM));
            if (offlineTime.inMinutes >= 1) {
              currentCake.currentStatus = 9;
              pref.setString("currentCake", jsonEncode(currentCake.toJson()));
              print("상함");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/home", (route) => false);
            } else {
              print("아직 안상해서 타이머로 이동");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/timer", (route) => false);
            }
          } else {
            print("타이머 미작동 상태로 홈 이동");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/home", (route) => false);
          }
        }
      }
    });
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
            style: TextStyle(
              fontFamily: "euljiro",
              color: textWhiteColor,
              fontSize: 40,
            ),
          ),
          Text(
            "시간을 기부하다",
            style: TextStyle(
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
