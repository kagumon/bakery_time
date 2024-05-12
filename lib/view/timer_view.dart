import 'dart:async';
import 'package:bakery_time/util/util_function.dart';
import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:bakery_time/widget/google_ad_widget.dart';
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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
  var battery = Battery();
  String _currentBattery = "";
  String _currentDTTM = "";
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences().then((value) => _loadData()).then((value) => _start());
    battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _currentBattery = state.toString();
      });
    });
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
 
  Future<void> _loadData() async {
    _targetTimer = _prefs.getDouble('timerSeconds')!;
    //_timerSeconds = _prefs.getDouble('timerSeconds')!;
    _timerSeconds = 30.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: timerBackgroundColor,
      body: _isRunning ? SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                widthSizeBox(30),
                Text(_currentDTTM),
                emptyExpanded(),
                Text(_currentBattery),
                widthSizeBox(30),
              ],
            ),
            emptyExpanded(),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width * 0.35)),
                  child: Image.asset(
                    'assets/images/loading_background.png',
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: MediaQuery.of(context).size.width * 0.70,
                    fit: BoxFit.cover
                  ),
                ),
                CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.width * 0.35,
                  lineWidth: 20.0,
                  animation: false,
                  percent: _timerSeconds / _targetTimer,
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: indicatorActiveColor,
                  backgroundColor: indicatorDisableColor,
                ),
              ],
            ),
            heightSizeBox(30),
            Center(
              child: Text(
                  secondFormatHHMMSS(_timerSeconds.floor()),
                  style: TextStyle(color: textWhiteColor, fontSize: 50),
              ),
            ),
            heightSizeBox(40),
            GestureDetector(
              onTap:() => {
                _reset(),
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (route) => false,
                )
              },
              child: GestureDetector(
                onTap: ()=> {
                  googleRewardedAdWidget((){
                    _reset();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (route) => false,
                    );
                  })
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: buttonWhiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50))
                  ),
                  child: Center(child: Text("중단할래요", style: TextStyle(color: textPrimaryColor),)),
                ),
              ),
            ),
            emptyExpanded(),
            GestureDetector(
              onTap:() => {
              },
              child: Center(child: Text("케이크를 완성하면?", style: TextStyle(color: textBlackColor),))
            ),
            heightSizeBox(30)
          ],
        ),
      ) : Container(),
    );
  }

  void _start() {
    if(_isRunning) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentDTTM = DateFormat('yyyy년 MM월 dd일\nHH:mm').format(DateTime.now());
      setState(() {
        _timerSeconds--;
        if(_timerSeconds.floor() <=  0) {
          _reset();
          Navigator.of(context).pushNamedAndRemoveUntil('/reward', (route) => false,);
        }
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