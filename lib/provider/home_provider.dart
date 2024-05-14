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
  late int _selectedItemIndex;

  SharedPreferences get pref => _pref;
  Cake get currentCake => _currentCake;
  BakeryTimer get bakeryTimer => _bakeryTimer;
  List<Item> get queryItemList => _queryItemList;
  Item get selectedItem => _selectedItem;

  HomeProvider() {
    setCurrentCake();
    setBakeryTimer();
    getItemList();
    initSelectedItem();
  }

  Future<void> setCurrentCake() async {
    if (_pref.getString("currentCake") == null ||
        _pref.getString("currentCake") == "") {
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
    if (_currentCake.currentStatus != 3) {
      _bakeryTimer = BakeryTimer(
        targetItemId: "",
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

  Future<void> setTimerTime(double value) async {
    _bakeryTimer.targetTime = value;
    notifyListeners();
  }

  Future<void> nextItemSelect(bool right) async {
    if (right) {
      _selectedItemIndex = ++_selectedItemIndex % _queryItemList.length;
    } else {
      _selectedItemIndex -= 1;
      if (_selectedItemIndex < 0) {
        _selectedItemIndex = _queryItemList.length - 1;
      }
    }
    _selectedItem = _queryItemList[_selectedItemIndex];

    _bakeryTimer.targetItemId = _selectedItem.id;
    _bakeryTimer.targetItemTime = _selectedItem.itemTime;
    saveBakeryTimer();
    notifyListeners();
  }

  Future<void> choiceItem(int idx) async {
    _selectedItem = _queryItemList[idx];
    _bakeryTimer.targetItemId = _selectedItem.id;
    _bakeryTimer.targetItemTime = _selectedItem.itemTime;
    saveBakeryTimer();
    notifyListeners();
  }

  /* 소유하고 있는 아이쳄을 조호하는 함수 step에 맞는 아이템만 보여줌 */
  Future<void> getItemList() async {
    _allItemList = ItemData().items;
    for (Item item in _allItemList) {
      if (item.unlock) {
        _queryItemList.add(item);
      }
    }
    notifyListeners();
  }

  Future<void> initSelectedItem() async {
    if (_currentCake.currentStatus == 3) {
      for (var i = 0; i < _queryItemList.length; i++) {
        if (_queryItemList[i].id == _bakeryTimer.targetItemId) {
          _selectedItem = _queryItemList[i];
          _selectedItemIndex = i;
        }
      }
    } else {
      _selectedItem = _queryItemList[0];
      _selectedItemIndex = 0;
      _bakeryTimer.targetItemId = _selectedItem.id;
      _bakeryTimer.targetItemTime = _selectedItem.itemTime;
    }
    saveBakeryTimer();
    notifyListeners();
  }

  Map<String, dynamic> showExplain() {
    Map<String, dynamic> result = {
      "visiable": false,
      "explainText": "",
      "color": "",
    };

    if ((_bakeryTimer.targetTime + _bakeryTimer.totalTime) /
            _bakeryTimer.targetItemTime >=
        1.0) {
      result["visiable"] = true;
      result["explainText"] = "필요한 시간을 모두 채웠어요!";
    } else if (_currentCake.currentStatus == 3) {
      result["visiable"] = true;
      result["explainText"] = "마저 만들어볼까요?";
    }

    return result;
  }
}
