import 'dart:async';

import 'package:bakery_time/model/timer.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  late Timer _timer;
  late double _timerSeconds = 0;
  late double _targetTimer = 0;
  late final SharedPreferences _prefs;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences().then((value) => _loadData()).then((value) => _start());
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
 
  Future<void> _loadData() async {
    _targetTimer = _prefs.getDouble('timerSeconds')!;
    _timerSeconds = _prefs.getDouble('timerSeconds')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isRunning ? SafeArea(
        child: Column(
          children: [
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
                max: _targetTimer,
                value: _timerSeconds,
                divisions: _targetTimer.floor(),
                onChanged: (value) {},
              ),
            ),
            Container(
              child: Center(
                child: Text("$_timerSeconds"),
              ),
            ),
            GestureDetector(
              onTap:() => {
                _reset(),
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (route) => false,
                )
              },
              child: Container(
                child: Text("포기하기"),
              ),
            )
          ],
        ),
      ) : Container(),
    );
  }

  void _start() {
    if(_isRunning) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        print("test");
        _timerSeconds--;
      });
    });
    _isRunning=true;
  }

  void _reset() {
    setState(() {
      _timer.cancel();
    });
  }
}