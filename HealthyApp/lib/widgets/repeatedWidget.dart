import 'package:flutter/material.dart';

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
        padding: EdgeInsets.only(
          left: 30.0,
          top: 30.0,
        ),
        child: Align(
          alignment: Alignment.topLeft,
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
