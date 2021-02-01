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

  testWidgets('Golden test', (WidgetTester tester) async {
    final shapedWidget = RepaintBoundary(
      child: Card(
        color: Colors.deepPurple,
        elevation: 0,
        shape: SuperellipseShape(
          borderRadius: BorderRadius.circular(124.0),
        ),
      ),
    );
    await tester.pumpWidget(shapedWidget);
    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile('golden/widget.png'),
    );
  });
}
