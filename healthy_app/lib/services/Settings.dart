import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  Settings({
    this.isBottle,
    this.noOfDrinks,
    this.time,
  });

  bool? isBottle;
  int? time;
  int? noOfDrinks;

  Future<void> updateBottleSettings(bool sentBool) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    isBottle = sentBool;
    sharedPreferences.setBool('isBottle', sentBool);
    notifyListeners();
  }

  Future<void> updateTimeSettings(int sentTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    time = sentTime;
    sharedPreferences.setInt('time', sentTime);
    notifyListeners();
  }

  Future<void> updateNoOfDrinksSettings(int sentNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    noOfDrinks = sentNumber;
    sharedPreferences.setInt('noOfDrinks', sentNumber);
    notifyListeners();
  }
}
