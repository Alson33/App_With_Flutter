import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({
    Key? key,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final String? title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1,
              color: color,
              fontFamily: 'cursive',
            ),
          ),
        ),
      ),
    );
  }
}

class SmallTitleWidget extends StatelessWidget {
  const SmallTitleWidget({
    Key? key,
    @required this.title,
    @required this.color,
    @required this.align,
  }) : super(key: key);

  final String? title;
  final Color? color;
  final Alignment? align;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: align!,
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 20,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
