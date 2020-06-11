import 'package:flutter/material.dart';
import 'customPaints/customPaints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            BarWidget(isSettingPage: false),
            TitleWidget(title: 'Drink'),
          ],
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  TitleWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            '$title',
            style: TextStyle(
              fontSize: 40.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  BarWidget({
    Key key,
    @required this.isSettingPage,
  }) : super(key: key);

  final bool isSettingPage;
  Icon icon = Icon(
    Icons.menu,
    color: Colors.black,
  );

  Icon _iconUsed() {
    if (isSettingPage) {
      return icon = Icon(
        Icons.remove,
        color: Colors.white,
      );
    } else {
      return icon = Icon(
        Icons.menu,
        color: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.only(right: 20.0),
          child: IconButton(
            icon: _iconUsed(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
