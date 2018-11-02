/**
 * flutter ui challenge
 * 请通过切换home注释查看
 */
import 'package:flutter/material.dart';
import 'animation_demo/hero_demo.dart';
import 'animation_demo/hide_bottom_bar.dart';
import 'animation_demo/audio_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.light(),
//      home: HeroDemo(),
//      home: HideBottomBarDemo(),
        home: AudioScreen(),
    );
  }
}

