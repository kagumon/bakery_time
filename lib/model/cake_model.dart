class Cake {
  String uuid;
  int? cakeTotalTime = 0;
  String? sheetId;
  String? creemId;
  String? accessoriesId1;
  String? accessoriesId2;
  String? accessoriesId3;
  int? step = 1;
  int? currentStatus = 0; // 0: 미작동중, 1: Timer 작동중, 2: 포장 완료, 3: 미완성, 9: 상함
  String? sheetEndDTTM;
  String? creemEndDTTM;
  String? accessories1EndDTTM;
  String? accessories2EndDTTM;
  String? accessories3EndDTTM;
  String? startDTTM;
  String? lastDTTM;

  Cake(
      {required this.uuid,
      this.cakeTotalTime,
      this.sheetId,
      this.creemId,
      this.accessoriesId1,
      this.accessoriesId2,
      this.accessoriesId3,
      this.step,
      this.currentStatus,
      this.sheetEndDTTM,
      this.creemEndDTTM,
      this.accessories1EndDTTM,
      this.accessories2EndDTTM,
      this.accessories3EndDTTM,
      this.startDTTM,
      this.lastDTTM});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['cakeTotalTime'] = cakeTotalTime;
    data['sheetId'] = sheetId;
    data['creemId'] = creemId;
    data['accessoriesId1'] = accessoriesId1;
    data['accessoriesId2'] = accessoriesId2;
    data['accessoriesId3'] = accessoriesId3;
    data['step'] = step;
    data['currentStatus'] = currentStatus;
    data['sheetEndDTTM'] = sheetEndDTTM;
    data['creemEndDTTM'] = creemEndDTTM;
    data['accessories1EndDTTM'] = accessories1EndDTTM;
    data['accessories2EndDTTM'] = accessories2EndDTTM;
    data['accessories3EndDTTM'] = accessories3EndDTTM;
    data['startDTTM'] = startDTTM;
    data['lastDTTM'] = lastDTTM;
    return data;
  }

  factory Cake.fromJson(Map<String, dynamic> json) {
    return Cake(
        uuid: json["uuid"],
        cakeTotalTime: json["cakeTotalTime"],
        sheetId: json["sheetId"],
        creemId: json["creemId"],
        accessoriesId1: json["accessoriesId1"],
        accessoriesId2: json["accessoriesId2"],
        accessoriesId3: json["accessoriesId3"],
        step: json["step"],
        currentStatus: json["currentStatus"],
        sheetEndDTTM: json["sheetEndDTTM"],
        creemEndDTTM: json["creemEndDTTM"],
        accessories1EndDTTM: json["accessories1EndDTTM"],
        accessories2EndDTTM: json["accessories2EndDTTM"],
        accessories3EndDTTM: json["accessories3EndDTTM"],
        startDTTM: json["startDTTM"],
        lastDTTM: json["lastDTTM"]);
  }
}
