import 'package:flutter/material.dart';
//import 'package:animation_demo/login_screen.dart';
//import 'package:animation_demo/animation_demo/basic_animation_demo.dart';
//import 'package:animation_demo/animation_demo/delayed_animation_demo.dart';
//import 'package:animation_demo/animation_demo/parent_animation_demo.dart';
//import 'package:animation_demo/animation_demo/another_parent_animation_demo.dart';
import 'package:animation_demo/animation_demo/transforming_animation_demo.dart';
//import 'package:animation_demo/animation_demo/value_change_animation_demo.dart';
//import 'package:animation_demo/animation_demo/hidden_widget_animation_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
