import 'package:healthy_app/recipePages/recipePage.dart';
import 'package:healthy_app/services/SettingDb.dart';
import 'package:healthy_app/services/Settings.dart';
import 'package:healthy_app/strechPages/strechPage.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';
import 'widgets/repeatedWidget.dart';
import 'homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool? _isBottle = sharedPreferences.getBool('isBottle');
  int? _noOfDrinks = sharedPreferences.getInt('noOfDrinks');
  int? _time = sharedPreferences.getInt('time');
  runApp(MyApp(
    isBottle: _isBottle,
    noOfDrinks: _noOfDrinks,
    time: _time,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    this.isBottle,
    this.noOfDrinks,
    this.time,
  });

  bool? isBottle;
  int? noOfDrinks;
  int? time;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Settings>(
          create: (context) => Settings(
            isBottle: isBottle,
            noOfDrinks: noOfDrinks,
            time: time,
          ),
        ),
      ],
      child: Consumer<Settings>(builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            canvasColor: Colors.transparent,
          ),
          home: HomePage(),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidSwipe(
        pages: [
          DrinkPage(),
          RecipePage(),
          StrechPage(),
        ],
        initialPage: 0,
        waveType: WaveType.liquidReveal,
        fullTransitionValue: 600,
        ignoreUserGestureWhileAnimating: true,
      ),
    );
  }
}

class DrinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: customMainColor,
      child: Column(
        children: <Widget>[
          TitleWidget(title: 'Drink', color: Colors.white),
          HomePageMainPart(),
        ],
      ),
    );
  }
}
