import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A rectangular shape but with a continuous rounded border that never
/// becomes completely flat on one side.
class SuperellipseShape extends ShapeBorder {
  /// The arguments must not be null.
  SuperellipseShape(
    this.n, {
    this.side = BorderSide.none,
  })  : assert(n != null),
        assert(side != null);

  /// n.
  final double n;

  /// The style of this border.
  final BorderSide side;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SuperellipseShape(
      n,
      side: side.scale(t),
    );
  }

  Path _getPath(Rect rect, double n) {
    /// Create empty path to complete.
    Path path = new Path();

    /// Define width and height, based on [rect] dimensions.
    double width = rect.width / 2;
    double height = rect.height / 2;

    double na = 2 / n;
    int step = 32 * 4;
    double piece = (math.pi * 2) / step;
    double t = 0.0;
    var apply = path.moveTo;

    /// Build path.
    for (int i = 0; i < step; i++) {
      var x = math.pow(math.cos(t).abs(), na) * width * math.cos(t).sign;
      var y = math.pow(math.sin(t).abs(), na) * height * math.sin(t).sign;
      apply(x, y);
      apply = path.lineTo;
      t += piece;
    }
    path.close();

    /// Shift path to center of [rect].
    return path.shift(rect.center);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return _getPath(rect, n);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return _getPath(rect, n);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    if (rect.isEmpty) return;
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        Path path = getOuterPath(rect, textDirection: textDirection);
        var paint = side.toPaint();
        canvas.drawPath(path, paint);
        break;
    }
  }
}
