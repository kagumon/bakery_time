import 'dart:async';
import 'dart:convert';
import 'package:bakery_time/model/bakery_timer_model.dart';
import 'package:bakery_time/model/cake_model.dart';
import 'package:bakery_time/util/pref_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerProvider with ChangeNotifier {
  final SharedPreferences _pref = PreferencesHandler.instance.pref;
  late Cake _currentCake;
  late BakeryTimer _bakeryTimer;
  late Timer _timer;

  bool _isRunning = false;
  bool _isFinish = false;

  SharedPreferences get pref => _pref;
  Cake get currentCake => _currentCake;
  BakeryTimer get bakeryTimer => _bakeryTimer;
  Timer get timer => _timer;
  bool get isRunning => _isRunning;
  bool get isFinish => _isFinish;

  TimerProvider() {
    setBakeryTimer();
    setCurrentCake();
    startTimer();
  }

  Future<void> setCurrentCake() async {
    String data = _pref.getString("currentCake")!;
    _currentCake = Cake.fromJson(jsonDecode(data));
  }

  Future<void> setBakeryTimer() async {
    String data = _pref.getString("currentTimer")!;
    _bakeryTimer = BakeryTimer.fromJson(jsonDecode(data));
  }

  Future<void> giveReward() async {
    if (_bakeryTimer.totalTime < _bakeryTimer.targetItemTime) {
      _currentCake.currentStatus = 3;
    } else {
      if (_currentCake.step == 1) {
        _currentCake.sheetId = "sht1001";
        _currentCake.sheetEndDTTM = DateTime.now().toString();
      } else if (_currentCake.step == 2) {
        _currentCake.creemId = "crm2001";
        _currentCake.creemEndDTTM = DateTime.now().toString();
      } else if (_currentCake.step == 3) {
        _currentCake.accessoriesId1 = "acc3001";
        _currentCake.accessories1EndDTTM = DateTime.now().toString();
      } else if (_currentCake.step == 4) {
        _currentCake.accessoriesId2 = "acc3002";
        _currentCake.accessories2EndDTTM = DateTime.now().toString();
      } else if (_currentCake.step == 5) {
        _currentCake.accessoriesId3 = "acc3003";
        _currentCake.accessories3EndDTTM = DateTime.now().toString();
      }
      _currentCake.step = _currentCake.step! + 1;
      _currentCake.currentStatus = 0;
    }

    _currentCake.lastDTTM = DateTime.now().toString();
    saveCurrentCake();
    saveBakeryTimer();
  }

  Future<void> giveUp() async {
    if (_currentCake.step == 1) {
      _currentCake.sheetId = "";
    } else if (_currentCake.step == 2) {
      _currentCake.creemId = "";
    } else if (_currentCake.step == 3) {
      _currentCake.accessoriesId1 = "";
    } else if (_currentCake.step == 4) {
      _currentCake.accessoriesId2 = "";
    } else if (_currentCake.step == 5) {
      _currentCake.accessoriesId3 = "";
    }
    _currentCake.currentStatus = 0;

    saveCurrentCake();
  }

  Future<void> saveCurrentCake() async {
    _pref.setString("currentCake", jsonEncode(_currentCake.toJson()));
  }

  Future<void> saveBakeryTimer() async {
    _pref.setString("currentTimer", jsonEncode(_bakeryTimer.toJson()));
  }

  void startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //bakeryTimer.timerTime++;
      _bakeryTimer.timerTime += 300;
      _bakeryTimer.lastDTTM = DateTime.now().toString();

      if (bakeryTimer.timerTime.floor() >= bakeryTimer.targetTime.floor()) {
        _timer.cancel();
        _bakeryTimer.totalTime += _bakeryTimer.targetTime;
        _isFinish = true;
      }
      saveBakeryTimer();
      notifyListeners();
    });
  }
}
