/**
 * 请切换import中的注释分别查看
 */
import 'package:flutter/material.dart';
//import 'overlay_demo.dart';
//import 'overlay_demo2.dart';
import 'overlay_demo3.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OverlayDemo(),
    );
  }
}

