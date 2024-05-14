class BakeryTimer {
  String targetItemId;
  double targetItemTime = 0;
  double totalTime = 0;
  double targetTime = 0;
  double timerTime = 0;
  String startDTTM;
  String lastDTTM;

  BakeryTimer(
      {required this.targetItemId,
      required this.targetItemTime,
      required this.totalTime,
      required this.targetTime,
      required this.timerTime,
      required this.startDTTM,
      required this.lastDTTM});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['targetItemId'] = targetItemId;
    data['targetItemTime'] = targetItemTime;
    data['totalTime'] = totalTime;
    data['targetTime'] = targetTime;
    data['timerTime'] = timerTime;
    data['startDTTM'] = startDTTM;
    data['lastDTTM'] = lastDTTM;
    return data;
  }

  factory BakeryTimer.fromJson(Map<String, dynamic> json) {
    return BakeryTimer(
        targetItemId: json["targetItemId"],
        targetItemTime: json["targetItemTime"],
        totalTime: json["totalTime"],
        targetTime: json["targetTime"],
        timerTime: json["timerTime"],
        startDTTM: json["startDTTM"],
        lastDTTM: json["lastDTTM"]);
  }
}
