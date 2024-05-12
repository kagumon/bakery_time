import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/item.dart';

class ItemDataSource {
  Future<List<Item>> getItemList() async {
    List<Map<String, dynamic>> items = [
      {"type": "sheets", "id": "sht1001", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "sheets", "id": "sht1002", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "sheets", "id": "sht1003", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "cream", "id": "crm2001", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "cream", "id": "crm2002", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "cream", "id": "crm2003", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "accessories", "id": "acc3001", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "accessories", "id": "acc3002", "price": 1500, "minTime": 1800, "unlock": 0},
      {"type": "accessories", "id": "acc3003", "price": 1500, "minTime": 1800, "unlock": 0},
    ];
    return items.map<Item>((value) => Item.fromJson(value)).toList();
  }
}
