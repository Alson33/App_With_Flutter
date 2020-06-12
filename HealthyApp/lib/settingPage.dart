import 'package:HealthyApp/repeatedWidget.dart';
import 'package:flutter/material.dart';
import 'customPaints/customPaints.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: UpperBigCircle(),
            size: Size.fromHeight(370),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomPaint(
              painter: LowerSmallCircle(),
              size: Size.fromHeight(200),
            ),
          ),
          Column(
            children: <Widget>[
              BarWidget(isSettingPage: true, index: 1),
              TitleWidget(title: 'Settings', color: Colors.white),
              Expanded(
                flex: 4,
                child: Text('Settings'),
              ),
              TitleWidget(title: 'Graph', color: Colors.black),
              Expanded(
                flex: 4,
                child: Text('Graph'),
              ),
              Expanded(
                flex: 1,
                child: Text('Growth rate'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
