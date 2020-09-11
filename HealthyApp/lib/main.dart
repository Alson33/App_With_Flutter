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
    return Scaffold(
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
              EatHealthyWidget(),
              BeHealthyWidget(),
            ],
          ),
        ],
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
  bool _isBottle = false;
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
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
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
              flex: 2,
              child: Table(
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // FIXME: Make attractive
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_isBottle) {
                                      if (_count <= 1) {
                                        _count = 1;
                                      } else {
                                        _count--;
                                      }
                                    } else {
                                      if (_count <= 4) {
                                        _count = 4;
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'At least 4 glass of water is needed'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } else {
                                        _count--;
                                      }
                                    }
                                  });
                                }),
                          ),
                          Expanded(
                            child: Text('$_count'),
                          ),
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_isBottle) {
                                      if (_count >= 5) {
                                        _count = 5;
                                        // FIXME: Try to experiment with options like flushbar or alert too
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'More than $_count Bottle per day is not good for heath'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } else {
                                        _count++;
                                      }
                                    } else {
                                      if (_count >= 20) {
                                        _count = 20;
                                        // FIXME: Try to experiment with options like flushbar or alert too
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'More than $_count Glass per day is not good for heath'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } else {
                                        _count++;
                                      }
                                    }
                                  });
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          // FIXME: Make attractive
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_countHour <= 1) {
                                      _countHour = 1;
                                    } else {
                                      _countHour--;
                                    }
                                  });
                                }),
                          ),
                          Expanded(
                            child: Text('$_countHour'),
                          ),
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_countHour >= 3) {
                                      _countHour = 3;
                                      // FIXME: Try to experiment with options like flushbar or alert too
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '$_countHour Hour gap is the most for water drinking gap'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      _countHour++;
                                    }
                                  });
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    // TODO: Make them more attractive and positioned properly
                    children: <Widget>[
                      Text('Add Bottle'),
                      Text('In Hour'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeHealthyWidget extends StatelessWidget {
  const BeHealthyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          children: <Widget>[
            // FIXME: Make info more attractive
            Expanded(
              flex: 5,
              child: Container(
                child: Text('Info'),
              ),
            ),
            // FIXME: Make a strech icon instead of text
            Expanded(
              flex: 2,
              child: Container(
                child: Text('StrechImage'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EatHealthyWidget extends StatelessWidget {
  const EatHealthyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          children: <Widget>[
            // FIXME: Make a vege icon instead of text
            Expanded(
              flex: 2,
              child: Container(
                child: GestureDetector(
                  child: Text('vegeImage'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RecipePage(),
                      ),
                    );
                  },
                ),
              ),
            ),
            // FIXME: Make info more attractive
            Expanded(
              flex: 5,
              child: Container(
                child: Text('Info...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
