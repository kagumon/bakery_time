import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  double _timerSeconds = 0.0;

  double get timerSeconds => _timerSeconds;

  HomeProvider();

  Future<void> setTimerSeconds(double value) async {
    _timerSeconds = value;
    notifyListeners();
  }
}
