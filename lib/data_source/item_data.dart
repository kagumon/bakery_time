import 'package:bakery_time/model/item_model.dart';

class ItemData {
  final List<Map<String, dynamic>> _items = [
    {"type": "sheets", "id": "sht1001", "price": 1500, "itemTime": 4800.0, "unlock": true},
    {"type": "sheets", "id": "sht1002", "price": 1500, "itemTime": 1200.0, "unlock": true},
    {"type": "sheets", "id": "sht1003", "price": 1500, "itemTime": 1800.0, "unlock": false},
    {"type": "cream", "id": "crm2001", "price": 1500, "itemTime": 2400.0, "unlock": true},
    {"type": "cream", "id": "crm2002", "price": 1500, "itemTime": 3000.0, "unlock": true},
    {"type": "cream", "id": "crm2003", "price": 1500, "itemTime": 1200.0, "unlock": false},
    {"type": "accessories", "id": "acc3001", "price": 1500, "itemTime": 1800.0, "unlock": true},
    {"type": "accessories", "id": "acc3002", "price": 1500, "itemTime": 2100.0, "unlock": true},
    {"type": "accessories", "id": "acc3003", "price": 1500, "itemTime": 3000.0, "unlock": false},
  ];

  List<Item> get items => _items.map<Item>((value) => Item.fromJson(value)).toList();
}