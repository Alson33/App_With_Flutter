import 'dart:convert';

import 'SettingDb.dart';

Setting settingFromJson(String str) => Setting.fromJson(json.decode(str));

String settingToJson(Setting data) => json.encode(data.toJson());

class Setting {
  Setting({
    this.id,
    this.medium,
    this.amountOfDrinks,
    this.timeToRemind,
  });

  int id;
  bool medium;
  int amountOfDrinks;
  int timeToRemind;

  int get getId => id;
  int get getAmount => amountOfDrinks;
  int get getTime => timeToRemind;
  bool get getMedium => medium;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        id: json[SettingDB.settingDB.columnId],
        medium: json[SettingDB.settingDB.columnMedium] == 1 ? true : false,
        amountOfDrinks: json[SettingDB.settingDB.columnAmount],
        timeToRemind: json[SettingDB.settingDB.columnTime],
      );

  Map<String, dynamic> toJson() => {
        SettingDB.settingDB.columnId: id,
        SettingDB.settingDB.columnMedium: medium == true ? 1 : 0,
        SettingDB.settingDB.columnAmount: amountOfDrinks,
        SettingDB.settingDB.columnTime: timeToRemind,
      };
}
