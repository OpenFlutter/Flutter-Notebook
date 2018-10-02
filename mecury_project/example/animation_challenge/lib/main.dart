import 'package:flutter/material.dart';
import 'animation_demo/animation_demo1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.light(),
      home: new MyHomePage(),
    );
  }
}

