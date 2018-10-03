import 'package:flutter/material.dart';
//import 'package:hero_demo/basic_structure_hero.dart';
import 'photo_hero.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SourceHeroPage(),
    );
  }
}
