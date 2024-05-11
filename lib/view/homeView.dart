import 'package:bakery_time/model/timer.dart';
import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/widget/GoogleAdWidget.dart';
import 'package:bakery_time/widget/MainDrawerWidget.dart';
import 'package:bakery_time/util/UtilFunction.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

import 'package:bakery_time/widget/MainAppBarWidget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _timerSeconds = 0.0;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  Future<void> _saveData() async {
    _prefs.setDouble('timerSeconds', _timerSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBarWidget(context),
      drawer: mainDrawerWidget(context),
      body: SafeArea(
        child: Container(
          color: main0001,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              showBannerWidget(),
              emptyExpanded(),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("오늘의 목표 : 공부"),
                  Expanded(child: SizedBox.shrink()),
                  Text("포장하기"),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8 + 20,
                    decoration: previewContainerDecoration(),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: CircularPercentIndicator(
                      radius: 15.0,
                      lineWidth: 8.0,
                      animation: true,
                      percent: 0.7,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 26.0,
                  trackShape: const RoundedRectSliderTrackShape(),
                  activeTrackColor: home0101,
                  inactiveTrackColor: home0102,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 14.0,
                    pressedElevation: 0.0,
                  ),
                  thumbColor: home0103,
                  overlayColor: home0104.withOpacity(0.5),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 20.0),
                  tickMarkShape: const RoundSliderTickMarkShape(),
                  inactiveTickMarkColor: home0105,
                ),
                child: Slider(
                  max: (3 * 60 * 60).toDouble(),
                  value: _timerSeconds,
                  divisions: 36,
                  //label: '',
                  onChanged: (value) {
                    setState(() {
                      _timerSeconds = value;
                    });
                  },
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              Text(
                secondFormatHHMMSS(_timerSeconds.floor()),
                style: TextStyle(color: comm0000, fontSize: 50),
              ),
              const Expanded(child: SizedBox.shrink()),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: timerStartButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector timerStartButton() {
    return GestureDetector(
      onTap: () => {
        _saveData(),
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/timer', (route) => false,
          arguments: TimerArguments(seconds: _timerSeconds)
        )
      },
      child: Container(
        decoration: startButtonDecoration(),
        child: Center(
            child: Text(
          "베이킹 시작하기",
          style: TextStyle(color: comm0001),
        )),
      ),
    );
  }
}

BoxDecoration previewContainerDecoration() {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      color: home0201,
      boxShadow: [
        BoxShadow(color: home0202, blurRadius: 5.0, spreadRadius: 1.0)
      ]);
}

BoxDecoration startButtonDecoration() {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      color: home0203,
      boxShadow: [
        BoxShadow(color: comm0002, blurRadius: 5.0, spreadRadius: 1.0)
      ]);
}
