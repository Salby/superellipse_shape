# Superellipse Shape

![Superellipses in flutter!](https://i.imgur.com/HbfbgBL.png)

A package for creating superellipse shapes in flutter.

```dart
class SuperEllipseDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.blueAccent[400],
      shape: SuperEllipseShape(5.0),
      child: Container(
        width: 100.0,
        height: 100.0,
      ),
    );

  }

}
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
