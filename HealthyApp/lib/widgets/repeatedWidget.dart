import 'package:flutter/material.dart';
import '../settings/settingPage.dart';

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
        padding: EdgeInsets.only(left: 30.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            '$title',
            style: TextStyle(
              fontSize: 30.0,
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
    // @required this.index,
  }) : super(key: key);

  final bool isSettingPage;
  // final int index;

  @override
  _BarWidgetState createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  Icon icon;

  Icon _iconUsed() {
    if (widget.isSettingPage) {
      icon = Icon(
        Icons.clear,
        color: Colors.white,
      );
    } else {
      icon = Icon(
        Icons.menu,
        color: Colors.black,
      );
    }

    return icon;
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
            iconSize: 30.0,
            icon: _iconUsed(),
            onPressed: () {
              if (!widget.isSettingPage) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              } else {
                // TODO: Add some data's to pass when returned from setting page
                Navigator.pop(context, );
              }
            },
          ),
        ),
      ),
    );
  }
}

class SmallTitleWidget extends StatelessWidget {
  const SmallTitleWidget({
    Key key,
    @required this.title,
    @required this.color,
    @required this.align,
  }) : super(key: key);

  final String title;
  final Color color;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: align,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            decoration: TextDecoration.underline,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}