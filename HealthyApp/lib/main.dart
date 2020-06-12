import 'package:flutter/material.dart';
import 'customPaints/customPaints.dart';
import 'repeatedWidget.dart';

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
              BarWidget(isSettingPage: false, index: 0),
              TitleWidget(title: 'Drink', color: Colors.white,),
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

class HomePageMainPart extends StatelessWidget {
  HomePageMainPart({
    Key key,
  }) : super(key: key);

  int _count = 1;
  int _countHour = 1;

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
                    for (int i = 1; i < _count; i++)
                      Expanded(
                        child: Icon(
                          Icons.local_drink,
                          color: Colors.black,
                        ),
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
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () {}),
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
                                onPressed: () {}),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () {}),
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
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
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
            Expanded(
              flex: 5,
              child: Container(
                child: Text('Info'),
              ),
            ),
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
            Expanded(
              flex: 2,
              child: Container(
                child: Text('vegeImage'),
              ),
            ),
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
