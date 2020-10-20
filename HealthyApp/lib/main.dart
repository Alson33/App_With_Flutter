import 'recipePages/recipePage.dart';
import 'package:flutter/material.dart';
import 'customPaints/customPaints.dart';
import 'widgets/repeatedWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
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
        body: Stack(
          children: <Widget>[
            // FIXME: Try to make animated transition
            CustomPaint(
              painter: UpperSmallCircle(),
              size: Size.fromHeight(200),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: LowerBigCircle(),
                size: Size.fromHeight(370),
              ),
            ),
            Column(
              children: <Widget>[
                BarWidget(isSettingPage: false),
                TitleWidget(title: 'Drink', color: Colors.white),
                HomePageMainPart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageMainPart extends StatefulWidget {
  HomePageMainPart({
    Key key,
  }) : super(key: key);

  @override
  _HomePageMainPartState createState() => _HomePageMainPartState();
}

class _HomePageMainPartState extends State<HomePageMainPart> {
  bool _isBottle = true;
  ImageIcon icon;
  int _count = 1;
  int _countHour = 1;

// TODO: Make Custom bottle and glass icon
  ImageIcon _changeBetweenBottleAndGlass() {
    if (_isBottle) {
      icon = ImageIcon(
        AssetImage("assets/icons/bottle.ico"),
        size: 350.0,
      );
    } else {
      icon = ImageIcon(
        AssetImage("assets/icons/glass.ico"),
        size: 400.0,
      );
    }

    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    for (int i = 1; i <= _count; i++)
                      Expanded(
                        child: _changeBetweenBottleAndGlass(),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100].withOpacity(0.2),
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.add,
                    ),
                    iconSize: 40,
                    onPressed: () {
                      _showSettingBottomSheet(context);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSettingBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bContext) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Choose a medium:'),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white10,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: 60,
                  height: 60,
                  child: Image.asset('assets/icons/bottle.ico'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white10,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: 60,
                  height: 60,
                  child: Image.asset('assets/icons/glass.ico'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No of bottles:'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('1'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('2'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('3'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('4'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('5'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Remind me in:'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('10min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('30min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('50min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('60min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('90min'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
