import 'package:healthy_app/recipePages/recipePage.dart';
import 'package:healthy_app/services/SettingDb.dart';
import 'package:healthy_app/services/Settings.dart';
import 'package:healthy_app/strechPages/strechPage.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';
import 'colors.dart';
import 'widgets/repeatedWidget.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Settings>(
            create: (context) => Settings(),
          ),
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LiquidSwipe(
          pages: [
            DrinkPage(),
            RecipePage(),
            StrechPage(),
          ],
          initialPage: 0,
          waveType: WaveType.liquidReveal,
          enableSlideIcon: true,
          fullTransitionValue: 600,
          ignoreUserGestureWhileAnimating: true,
        ),
      ),
    );
  }
}

class DrinkPage extends StatefulWidget {
  @override
  _DrinkPageState createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  @override
  void initState() {
    SettingDB.settingDB.database.then((_) {
      print("open db");

      Provider.of<Settings>(
        context,
        listen: false,
      ).setSetting();
    });
    super.initState();
  }

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
