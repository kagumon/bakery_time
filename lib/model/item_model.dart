class Item {
  String type;
  String id;
  int price;
  int minTime;
  bool unlock;

  Item({
    required this.type,
    required this.id,
    required this.price,
    required this.minTime,
    required this.unlock
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(type: json['type'], id: json['id'], price: json['price'], minTime: json['minTime'], unlock: json['unlock']);
  }
}
