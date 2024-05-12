class Item {
  String type;
  String id;
  int? price=1000;
  int? minTime=1800;
  int? unlock=0;

  Item({
    required this.type,
    required this.id,
    this.price,
    this.minTime,
    this.unlock
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(type: json['type'], id: json['id'], price: json['price'], minTime: json['minTime'], unlock: json['unlock']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['price'] = price;
    data['minTime'] = minTime;
    data['unlock'] = unlock;
    return data;
  }
}
