import 'dart:math';
import 'package:flutter/material.dart';

class SuperellipseShape extends ShapeBorder {
  final double n;
  final BorderSide side;

  SuperellipseShape(
    this.n, {
    this.side = BorderSide.none,
  })  : assert(n != null),
        assert(side != null);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SuperellipseShape(
      n,
      side: side.scale(t),
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return _superellipseShapePath(rect.deflate(side.width), n);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return _superellipseShapePath(rect, n);
  }

  static Path _superellipseShapePath(Rect rect, double n) {
    Path path = new Path();

    // Define steps.
    double a = rect.width / 2;
    double b = rect.height / 2;
    double na = 2 / n;
    int step = 32 * 4;
    double piece = (pi * 2) / step;
    double t = 0.0;
    var apply = path.moveTo;

    // Build path.
    for (int i = 0; i < step; i++) {
      var x = pow(cos(t).abs(), na) * a * cos(t).sign;
      var y = pow(sin(t).abs(), na) * b * sin(t).sign;
      apply(x, y);
      apply = path.lineTo;
      t += piece;
    }

    path.close();

    return path.shift(rect.center);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    Path path = getOuterPath(rect, textDirection: textDirection);
    var paint = side.toPaint();
    canvas.drawPath(path, paint);
  }
}
