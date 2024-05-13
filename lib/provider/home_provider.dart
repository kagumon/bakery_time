import 'dart:convert';
import 'package:bakery_time/data_source/item_data.dart';
import 'package:bakery_time/model/bakery_timer_model.dart';
import 'package:bakery_time/model/cake_model.dart';
import 'package:bakery_time/model/item_model.dart';
import 'package:bakery_time/util/pref_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class HomeProvider with ChangeNotifier {
  final SharedPreferences _pref = PreferencesHandler.instance.pref;
  late Cake _currentCake;
  late List<Item> _allItemList = List.empty(growable: true);
  late final List<Item> _queryItemList = List.empty(growable: true);
  late BakeryTimer _bakeryTimer;
  late Item _selectedItem;

  SharedPreferences get pref => _pref;
  Cake get currentCake => _currentCake;
  BakeryTimer get bakeryTimer => _bakeryTimer;
  List<Item> get queryItemList => _queryItemList;
  Item get selectedItem =>_selectedItem;

  HomeProvider() {
    setCurrentCake();
    setBakeryTimer();
    getItemList();
  }

  Future<void> setCurrentCake() async {
    if(_pref.getString("currentCake") == null || _pref.getString("currentCake") == "") {
      _currentCake = Cake(
        uuid: const Uuid().v4(),
        cakeTotalTime: 0,
        step: 1,
        currentStatus: 0,
        startDTTM: DateTime.now().toString(),
      );
      saveCurrentCake();
    } else {
      String data = _pref.getString("currentCake")!;
      _currentCake = Cake.fromJson(jsonDecode(data));
    }
  }

  Future<void> saveCurrentCake() async {
    _pref.setString("currentCake", jsonEncode(_currentCake.toJson()));
  }

  Future<void> setBakeryTimer() async {
    if(_currentCake.currentStatus != 3) {
      _bakeryTimer = BakeryTimer(
        targetItemId:"",
        targetItemTime: 0.0,
        totalTime: 0.0,
        targetTime: 15 * 60,
        timerTime: 0.0,
        startDTTM: "",
        lastDTTM: "",
      );
    } else {
      String data = _pref.getString("currentTimer")!;
      _bakeryTimer = BakeryTimer.fromJson(jsonDecode(data));
      _bakeryTimer.targetTime = 15 * 60;
      _bakeryTimer.timerTime = 0;
    }
    saveBakeryTimer();
  }

  Future<void> saveBakeryTimer() async {
    _pref.setString("currentTimer", jsonEncode(_bakeryTimer.toJson()));
  }

  Future<void> startTimer() async {
    _bakeryTimer.startDTTM = DateTime.now().toString();
    _bakeryTimer.lastDTTM = DateTime.now().toString();
    _currentCake.currentStatus = 1;
    saveBakeryTimer();
    saveCurrentCake();
  }

  Future<void> settimerTime(double value) async {
    _bakeryTimer.targetTime = value;
    notifyListeners();
  }

  /* 소유하고 있는 아이쳄을 조호하는 함수 step에 맞는 아이템만 보여줌 */
  Future<void> getItemList() async {
    _allItemList = ItemData().items;
    for(Item item in _allItemList) {
      if(item.unlock) {
        _queryItemList.add(item);
      }
    }
    _selectedItem = _queryItemList[0];
    _bakeryTimer.targetItemId = _selectedItem.id;
    _bakeryTimer.targetItemTime = 4000;
    //_bakeryTimer.totalTime = 0;
    notifyListeners();
  }
}
