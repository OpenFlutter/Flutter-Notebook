/**
 * 请切换home注释查看不同页面
 */
import 'package:flutter/material.dart';
import 'expansion_tile.dart';
import 'expansion_panel_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.dark(),
//      home: ExpansionPanelListDemo(),
    home: ExpansionTileDemo(),
    );
  }
}
