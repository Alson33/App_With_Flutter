import 'package:healthy_app/services/SettingDb.dart';
import 'package:healthy_app/services/setting.dart';
import 'package:flutter/cupertino.dart';

class Settings extends ChangeNotifier {
  bool _isBottle = true;
  int _time = 90;
  int _noOfDrinks = 1;
  int _id = 1;

  void setSetting() async {
    List<Setting> settingInfo = await SettingDB.settingDB.getSetting();
    print(settingInfo);
    _isBottle = settingInfo[0].getMedium;
    _time = settingInfo[0].getTime;
    _noOfDrinks = settingInfo[0].getAmount;
    _id = settingInfo[0].getId;
  }

  bool get isBottle => _isBottle;
  int get time => _time;
  int get noOfDrinks => _noOfDrinks;

  void update() {
    Setting newSetting = Setting(
      amountOfDrinks: _noOfDrinks,
      medium: _isBottle,
      timeToRemind: _time,
      id: _id,
    );

    SettingDB.settingDB.update(newSetting);
  }

  void updateBottleSettings(bool sentBool) {
    _isBottle = sentBool;
    update();
    notifyListeners();
  }

  void updateTimeSettings(int sentTime) {
    _time = sentTime;
    update();
    notifyListeners();
  }

  void updateNoOfDrinksSettings(int sentNumber) {
    _noOfDrinks = sentNumber;
    update();
    notifyListeners();
  }

  void updateNoOfDrinksWhenDrunk(int sentNumber) {
    _noOfDrinks--;

    notifyListeners();
  }
}
