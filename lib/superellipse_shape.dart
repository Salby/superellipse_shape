import 'package:flutter/material.dart';

/// Creates a shape constituting a transition between a rectangle and a circle.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Material(
///     shape: SuperellipseShape(25.0),
///   ); // Material
/// }
/// ```
class SuperellipseShape extends ShapeBorder {
  /// The arguments must not be null.
  SuperellipseShape(
    this.superRadius, {
    this.side = BorderSide.none,
  })  : assert(superRadius != null),
        assert(side != null);

  final double superRadius;

  /// The style of this border.
  final BorderSide side;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SuperellipseShape(
      superRadius,
      side: side.scale(t),
    );
  }

  Path _getPath(Rect rect, double superRadius) {
    /// Define the different variables of [rect].
    final center = rect.center;
    final double left = rect.left;
    final double right = rect.right;
    final double top = rect.top;
    final double bottom = rect.bottom;

    /// [centerX] and [centerY] are only used if [superRadius] is null.
    final double centerX = center.dx;
    final double centerY = center.dy;

    /// Defaults to predefined shape if [superRadius] is null.
    if (superRadius == null) {
      return Path()
        ..moveTo(left, centerY)
        ..cubicTo(left, top, left, top, centerX, top)
        ..cubicTo(right, top, right, top, right, centerY)
        ..cubicTo(right, bottom, right, bottom, centerX, bottom)
        ..cubicTo(left, bottom, left, bottom, left, centerY)
        ..close();
    }

    /// Construct path from [rect] variables and [superRadius].
    return Path()
      ..moveTo(left, top + superRadius)
      ..cubicTo(left, top, left, top, left + superRadius, top)
      ..lineTo(right - superRadius, top)
      ..cubicTo(right, top, right, top, right, top + superRadius)
      ..lineTo(right, bottom - superRadius)
      ..cubicTo(right, bottom, right, bottom, right - superRadius, bottom)
      ..lineTo(left + superRadius, bottom)
      ..cubicTo(left, bottom, left, bottom, left, bottom - superRadius)
      ..close();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return _getPath(rect, superRadius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return _getPath(rect, superRadius);
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
