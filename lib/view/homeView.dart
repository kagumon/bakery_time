import 'dart:async';

import 'package:bakery_time/widget/MainDrawerWidget.dart';
import 'package:bakery_time/widget/UtilFunction.dart';
import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

import 'package:bakery_time/widget/MainAppBarWidget.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _timerSeconds = 0.0;
  double _targetTimer = 0.0;
  bool _isRunning = false;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBarWidget(context),
      drawer: mainDrawerWidget(context),
      body: Container(
        color: colorPrimary100,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
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
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8 + 20,
              decoration: previewContainerDecoration(),
            ),
            const SizedBox(
              height: 20,
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 26.0,
                trackShape: const RoundedRectSliderTrackShape(),
                activeTrackColor: colorPrimary700,
                inactiveTrackColor: colorPrimary300,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 14.0,
                  pressedElevation: 0.0,
                ),
                thumbColor: colorPrimary500,
                overlayColor: colorPrimary800.withOpacity(0.5),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 20.0),
                tickMarkShape: const RoundSliderTickMarkShape(),
                inactiveTickMarkColor: colorPrimaryWhite,
              ),
              child: Slider(
                max: _isRunning ? _targetTimer : (3*60*60).toDouble(),
                value: _timerSeconds,
                divisions: _isRunning ? _targetTimer.floor() : 36,
                //label: '',
                onChanged: (value) {
                  if(_isRunning == false) {
                    setState(() {
                      _timerSeconds = value;
                    });
                  }
                },
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            Text(secondFormatHHMMSS(_timerSeconds.floor()),
              style: const TextStyle(color: colorPrimary900, fontSize: 50),
            ),
            const Expanded(child: SizedBox.shrink()),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.6,
              child: _isRunning ? timerRunningText() : timerStartButton(),
            ),
            heightSizeBox(20)
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    if(_isRunning == true) {return;}
    _isRunning = true;
    _targetTimer = _timerSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timerSeconds--;
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _timerSeconds = 0;
    });
  }

  GestureDetector timerStartButton() {
    return GestureDetector(
      onTap: () => {_startTimer()},
      child: Container(
        decoration: startButtonDecoration(),
        child: const Center(
            child: Text("베이킹 시작하기",
          style: TextStyle(color: colorPrimaryWhite),
        )),
      ),
    );
  }

  Container timerRunningText() {
    return Container(
      decoration: startButtonDecoration(),
      child: const Center(
          child: Text("시간을 굽는중이에요!",
        style: TextStyle(color: colorPrimaryWhite),
      )),
    );
  }
}
BoxDecoration previewContainerDecoration() {
  return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: colorPrimaryWhite,
      boxShadow: [
        BoxShadow(color: colorPrimary800, blurRadius: 5.0, spreadRadius: 1.0)
      ]);
}

BoxDecoration startButtonDecoration() {
  return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: colorPrimary800,
      boxShadow: [
        BoxShadow(
            color: colorPrimaryBlack,
            blurRadius: 5.0,
            spreadRadius: 1.0)
      ]);
}
