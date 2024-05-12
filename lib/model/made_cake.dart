import 'package:uuid/uuid.dart';

class MadeCake {
  String? uuid = const Uuid().v4();
  int? cakeTotalTime = 0;
  String? sheetId = "";
  String? creemId = "";
  String? accessoriesId1 = "";
  String? accessoriesId2 = "";
  String? accessoriesId3 = "";
  int? step = 1;
  int? currentStatus = 0;
  int? targetItemTime = 0;
  DateTime? sheetEndDTTM;
  DateTime? creemEndDTTM;
  DateTime? accessories1EndDTTM;
  DateTime? accessories2EndDTTM;
  DateTime? accessories3EndDTTM;
  DateTime? startDTTM;
  DateTime? lastDTTM;

  MadeCake({
    this.uuid,
    this.cakeTotalTime,
    this.sheetId,
    this.creemId,
    this.accessoriesId1,
    this.accessoriesId2,
    this.accessoriesId3,
    this.step,
    this.currentStatus,
    this.targetItemTime,
    this.sheetEndDTTM,
    this.creemEndDTTM,
    this.accessories1EndDTTM,
    this.accessories2EndDTTM,
    this.accessories3EndDTTM,
    this.startDTTM,
    this.lastDTTM
  });

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
    data['targetItemTime'] = targetItemTime;
    data['sheetEndDTTM'] = sheetEndDTTM;
    data['creemEndDTTM'] = creemEndDTTM;
    data['accessories1EndDTTM'] = accessories1EndDTTM;
    data['accessories2EndDTTM'] = accessories2EndDTTM;
    data['accessories3EndDTTM'] = accessories3EndDTTM;
    data['startDTTM'] = startDTTM;
    data['lastDTTM'] = lastDTTM;
    return data;
  }

}