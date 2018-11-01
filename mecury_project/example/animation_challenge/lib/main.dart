/**
 * flutter ui challenge
 * 请通过切换home注释查看
 */
import 'package:flutter/material.dart';
import 'animation_demo/hero_demo.dart';
import 'animation_demo/hide_bottom_bar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.dark(),
//      home: new HeroDemo(),
      home: HideBottomBarDemo(),
    );
  }
}

