import 'package:bakery_time/data_source/item_data.dart';
import 'package:bakery_time/model/item_model.dart';
import 'package:flutter/material.dart';

class ShopProvider with ChangeNotifier {
  /* 데이터 가공할 클래스 내부 변수 */
  List<Item> _allItemList = List.empty(growable: true);
  final List<Item> _itemList = List.empty(growable: true);
  final List<Map<String, dynamic>> _tabList = [
    {"selected": true, "type": "sheets", "title": "베이스"},
    {"selected": false, "type": "cream", "title": "데코레이션"},
    {"selected": false, "type": "accessories", "title": "포장"},
  ];
  int _currentTabIndex = 0;

  /* 화면에 전달할 공개 데이터 Get 함수 */
  List<Item> get itemList => _itemList;
  List<Map<String, dynamic>> get tabList => _tabList;
  int get currentTabIndex => _currentTabIndex;

  /* 생성자 함수 */
  ShopProvider() {
    getItemList();
  }

  /* notifyListeners 함수 */
  Future<void> getItemList() async {
    _allItemList = ItemData().items;
    setSelectedItem();
    notifyListeners();
  }

  Future<void> setSelectedItem() async {
    _itemList.clear();
    for (var item in _allItemList) {
      if (_tabList[_currentTabIndex]["type"] == item.type) {
        _itemList.add(item);
      }
    }
    notifyListeners();
  }

  Future<void> chageTab(int idx) async {
    _tabList[_currentTabIndex]["selected"] = false;
    _tabList[idx]["selected"] = true;
    _currentTabIndex = idx;
    setSelectedItem();
    notifyListeners();
  }
}
