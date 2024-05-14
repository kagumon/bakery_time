class Item {
  String type;
  String id;
  int price;
  double itemTime;
  bool unlock;

  Item(
      {required this.type,
      required this.id,
      required this.price,
      required this.itemTime,
      required this.unlock});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        type: json['type'],
        id: json['id'],
        price: json['price'],
        itemTime: json['itemTime'],
        unlock: json['unlock']);
  }
}
