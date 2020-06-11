import 'package:flutter/material.dart';

class UpperSmallCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..moveTo(size.width / 2, 0)
      ..quadraticBezierTo(size.width, size.height, 0, size.height)
      ..close();

    paint.color = Colors.blue[400];

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(UpperSmallCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(UpperSmallCircle oldDelegate) => false;
}

class LowerBigCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path
      ..quadraticBezierTo(size.width / 2, -100, size.width, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    paint.color = Colors.blue[400];

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LowerBigCircle oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LowerBigCircle oldDelegate) => false;
}
