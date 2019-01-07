# Superellipse Shape

![Superellipses in flutter!](https://i.imgur.com/HbfbgBL.png)

A package for creating superellipse shapes in flutter.

```dart
class SuperellipseDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.blueAccent[400],
      shape: SuperellipseShape(25.0),
      child: Container(
        width: 100.0,
        height: 100.0,
      ),
    );

  }

}
```
