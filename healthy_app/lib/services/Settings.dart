// import 'package:healthy_app/services/SettingDb.dart';
// import 'package:healthy_app/services/setting.dart';
import 'package:flutter/cupertino.dart';

class Settings extends ChangeNotifier {
  bool? _isBottle;
  int _time = 20;
  int _noOfDrinks = 1;
  // int _id = 1;

  // void setSetting() async {
  //   List<Setting> settingInfo = await SettingDB.settingDB.getSetting();
  //   // print(settingInfo);
  //   _isBottle = settingInfo[0].getMedium;
  //   _time = settingInfo[0].getTime;
  //   _noOfDrinks = settingInfo[0].getAmount;
  //   _id = settingInfo[0].getId;
  // }

  bool? get isBottle => _isBottle;
  int get time => _time;
  int get noOfDrinks => _noOfDrinks;

  // Future<void> update() async {
  //   Setting newSetting = Setting(
  //     amountOfDrinks: _noOfDrinks,
  //     medium: _isBottle,
  //     timeToRemind: _time,
  //     id: _id,
  //   );

  //   await SettingDB.settingDB.update(newSetting);
  // }

  void updateBottleSettings(bool? sentBool) {
    print(sentBool);
    _isBottle = sentBool;
    // update();
    notifyListeners();
  }

  void updateTimeSettings(int sentTime) {
    _time = sentTime;
    // update();
    notifyListeners();
  }

  void updateNoOfDrinksSettings(int sentNumber) {
    _noOfDrinks = sentNumber;
    // await update();
    notifyListeners();
  }

  void updateNoOfDrinksWhenDrunk(int sentNumber) {
    _noOfDrinks--;

    notifyListeners();
  }
}
