import 'package:HealthyApp/widgets/repeatedWidget.dart';
import 'package:flutter/material.dart';
import '../customPaints/customPaints.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 40.0,
                      ),
                      child: Text(
                        'Growth rate',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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

  final bool switchTile = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 30.0,
        ),
        child: ListTile(
          title: Text(objectiveText),
          trailing: Text(objectiveIcon),
        ),
      ),
    );
  }
}

// Row(
//         children: <Widget>[
//           Expanded(
//             child: Text('$objectiveText'),
//           ),
//           Expanded(
//             child: Text('$objectiveIcon'),
//           ),
//         ],
//       ),
