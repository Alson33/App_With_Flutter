import 'package:flutter/material.dart';

// custom paint for the circle in upper part in home page
class UpperSmallCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..lineTo(size.width / 2, 0)
      ..quadraticBezierTo(size.width / 2, size.height, 0, size.height)
      ..lineTo(0, 0)
      ..close();

    paint.color = Colors.blue[400];

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(UpperSmallCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(UpperSmallCircle oldDelegate) => false;
}

// custom paint for the circle in lower part in home page
class LowerBigCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..quadraticBezierTo(size.width / 2, -100, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    paint.color = Colors.blue[400];

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LowerBigCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LowerBigCircle oldDelegate) => false;
}

// custom paint for the circle in upper part of the setting page
class UpperBigCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height + 100, size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    paint.color = Colors.blue[400];

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(UpperBigCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(UpperBigCircle oldDelegate) => false;
}

// custom paint for the circle in upper part of the setting page
class LowerSmallCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..moveTo(size.width, 0)
      ..quadraticBezierTo(size.width/2, 0, size.width/2, size.height)
      ..lineTo(size.width, size.height);

    paint.color = Colors.blue[400];

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LowerSmallCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LowerSmallCircle oldDelegate) => false;
}
