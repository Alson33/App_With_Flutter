import 'package:flutter/material.dart';
import 'settingPage.dart';
import 'main.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({
    Key key,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

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
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class BarWidget extends StatefulWidget {
  BarWidget({
    Key key,
    @required this.isSettingPage,
    @required this.index,
  }) : super(key: key);

  final bool isSettingPage;
  final int index;

  @override
  _BarWidgetState createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {

  List<Widget> _pageRoute = [
    SettingPage(),
    HomePage(),
  ];

  Icon icon = Icon(
    Icons.menu,
    color: Colors.black,
  );

  Icon _iconUsed() {
    if (widget.isSettingPage) {
      return icon = Icon(
        Icons.clear,
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
      flex: 1,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.only(
            top: 40.0,
            right: 20.0,
          ),
          child: IconButton(
            icon: _iconUsed(),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _pageRoute[widget.index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
