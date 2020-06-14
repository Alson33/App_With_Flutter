import 'package:HealthyApp/repeatedWidget.dart';
import 'package:flutter/material.dart';
import '../customPaints/customPaints.dart';

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
              BarWidget(isSettingPage: true),
              TitleWidget(title: 'Settings', color: Colors.white),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.grey[100],
                      height: 2.0,
                    ),
                    // TODO: Make IconButtons for the objectiveIcon
                    SettingPageMainPart(
                        objectiveText: 'Change the color theme',
                        objectiveIcon: 'Color picker'),
                    SettingPageMainPart(
                        objectiveText: 'Change between bottle and glass',
                        objectiveIcon: 'Bottle/Glass'),
                    SettingPageMainPart(
                        objectiveText: 'Chaneg hour and minute',
                        objectiveIcon: 'Hr/min'),
                    Divider(
                      color: Colors.grey[100],
                      height: 2.0,
                    ),
                  ],
                ),
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

class SettingPageMainPart extends StatelessWidget {
  const SettingPageMainPart({
    Key key,
    @required this.objectiveText,
    @required this.objectiveIcon,
  }) : super(key: key);

  final String objectiveText;
  // FIXME: Make objectiveIcon a icon widget
  final String objectiveIcon;

  @override
  Widget build(BuildContext context) {
    // TODO: Make it Attractive maybe try using listTile or SwitchTile
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('$objectiveText'),
          ),
          Expanded(
            child: Text('$objectiveIcon'),
          ),
        ],
      ),
    );
  }
}
