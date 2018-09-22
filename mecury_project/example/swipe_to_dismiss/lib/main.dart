import 'package:flutter/material.dart';
import 'swipe_to_dismiss_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.dark(),
      home: SwipeToDissmissDemo(),
    );
  }
}
