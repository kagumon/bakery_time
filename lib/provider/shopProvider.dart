import 'package:bakery_time/model/item.dart';
import 'package:flutter/material.dart';
import 'package:bakery_time/dataSource/itemDataSource.dart';

class ShopProvider with ChangeNotifier {
  List<Item> _allItemList = List.empty(growable: true);
  List<Item> _itemList = List.empty(growable: true);
  List<Map<String, dynamic>> _tabList = [
    {"selected": true,  "type" : "sheets", "title": "베이스"},
    {"selected": false, "type" : "cream", "title": "데코레이션"},
    {"selected": false, "type" : "accessories", "title": "포장"},
  ];
  int _currentTabIndex = 0;

  List<Item> get itemList => _itemList;
  List<Map<String, dynamic>> get tabList => _tabList;
  int get currentTabIndex => _currentTabIndex;

  ShopProvider() {
    getItemList();
  }

  Future<void> getItemList() async {
    _allItemList = await ItemDataSource().getItemList();
    setSelectedItem();
    notifyListeners();
  }

  Future<void> setSelectedItem() async {
    _itemList.clear();
    for (var item in _allItemList) {
      if(_tabList[_currentTabIndex]["type"] == item.type) {
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
