import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Settings extends ChangeNotifier {
  bool _isBottle = true;
  int _time = 30;
  int _noOfDrinks = 1;

  bool get isBottle => _isBottle;
  int get time => _time;
  int get noOfDrinks => _noOfDrinks;

  void updateBottleSettings(bool sentBool) {
    _isBottle = sentBool;

    notifyListeners();
  }

  void updateTimeSettings(int sentTime) {
    _time = sentTime;

    notifyListeners();
  }

  void updateNoOfDrinksSettings(int sentNumber) {
    _noOfDrinks = sentNumber;

    notifyListeners();
  }
}
