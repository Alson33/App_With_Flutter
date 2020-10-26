import 'package:HealthyApp/customPaints/colors.dart';
import 'package:flutter/material.dart';

// custom paint for the circle in upper part in home page
class UpperSmallCircle extends CustomPainter {
  const UpperSmallCircle({
    this.context,
  });

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..lineTo(MediaQuery.of(context).size.width / 2, 0)
      ..quadraticBezierTo(
        MediaQuery.of(context).size.width / 2,
        MediaQuery.of(context).size.height * .3,
        0,
        MediaQuery.of(context).size.height * .3,
      )
      ..lineTo(0, 0)
      ..close();

    paint.color = customMainColor;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(UpperSmallCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(UpperSmallCircle oldDelegate) => false;
}

// custom paint for the circle in lower part in home page
class LowerBigCircle extends CustomPainter {
  LowerBigCircle({
    this.context,
  });

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..quadraticBezierTo(
        MediaQuery.of(context).size.width / 2,
        -100,
        MediaQuery.of(context).size.width,
        0,
      )
      ..lineTo(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      )
      ..lineTo(
        0,
        MediaQuery.of(context).size.height,
      )
      ..close();

    paint.color = customMainColor;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LowerBigCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LowerBigCircle oldDelegate) => false;
}

// custom paint for the circle in upper part of the setting page
class UpperBigCircle extends CustomPainter {
  UpperBigCircle({
    this.context,
  });

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..lineTo(0, MediaQuery.of(context).size.height * .5)
      ..quadraticBezierTo(
        MediaQuery.of(context).size.width / 2,
        MediaQuery.of(context).size.height * .6,
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * .5,
      )
      ..lineTo(
        MediaQuery.of(context).size.width,
        0,
      )
      ..close();

    paint.color = customMainColor;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(UpperBigCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(UpperBigCircle oldDelegate) => false;
}

// custom paint for the circle in upper part of the setting page
class LowerSmallCircle extends CustomPainter {
  LowerSmallCircle({
    this.context,
  });

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..moveTo(MediaQuery.of(context).size.width, 0)
      ..quadraticBezierTo(
        MediaQuery.of(context).size.width * .4,
        0,
        MediaQuery.of(context).size.width * .4,
        MediaQuery.of(context).size.height * .7,
      )
      ..lineTo(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      );

    paint.color = customMainColor;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LowerSmallCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LowerSmallCircle oldDelegate) => false;
}
