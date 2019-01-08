import 'package:flutter/material.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SuperellipseCard(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Text('This is a nice, rounded card.'),
            ), // Padding
          ), // SuperellipseCard
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}

class SuperellipseCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final double elevation;

  SuperellipseCard({
    this.color,
    this.child,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: SuperellipseShape(25.0),
      color: color ?? Colors.white,
      shadowColor: color ?? Colors.black38,
      elevation: elevation ?? 1.0,
      child: child,
    ); // Material
  }
}
