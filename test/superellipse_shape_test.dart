import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

void main() {
  test('Border radius is applied and not modified by the shape', () {
    BorderRadiusGeometry borderRadius = BorderRadius.circular(28.0);

    SuperellipseShape testShape = SuperellipseShape(
      borderRadius: borderRadius,
    );

    expect(testShape.borderRadius, BorderRadius.circular(28.0));
  });
}
