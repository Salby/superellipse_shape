import 'package:flutter_test/flutter_test.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

void main() {
  test('Shape test', () {
    var superRadius = 25.0;

    SuperellipseShape testShape = SuperellipseShape(superRadius);

    expect(testShape.superRadius, 25.0);
  });
}
