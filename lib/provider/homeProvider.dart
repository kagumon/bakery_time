import 'package:bakery_time/model/item.dart';
import 'package:flutter/material.dart';
import 'package:bakery_time/dataSource/itemDataSource.dart';

class HomeProvider with ChangeNotifier {
  double _timerSeconds = 0.0;

  double get timerSeconds => _timerSeconds;

  HomeProvider();

  Future<void> setTimerSeconds(double value) async {
    _timerSeconds = value;
    notifyListeners();
  }
}
