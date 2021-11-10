# Superellipse Shape

![Superellipses in flutter!](https://i.imgur.com/HbfbgBL.png)

A package for creating superellipse shapes in flutter.

___

```dart
class SuperellipseDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent[400],
      shape: SuperellipseShape(
        borderRadius: BorderRadius.circular(28.0),
      ), // SuperellipseShape
      child: Container(
        width: 100.0,
        height: 100.0,
      ), // Container
    ); // Material
  }
}
```
