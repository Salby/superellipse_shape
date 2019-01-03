import 'package:flutter_test/flutter_test.dart';
import 'package:flutterellipse_shape/superellipse_shape.dart';

void main() {

  test('Shape test', () {

    var n = 5.0;

    SuperEllipseShape testShape = SuperEllipseShape(n);

    expect(testShape.n, 5.0);

  });

}