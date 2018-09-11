/**
 * 分别通过切换import中的注释来查看三个页面。
 * 建议分开阅读，下拉刷新和上拉加载的实现方式
 */
import 'package:flutter/material.dart';

//import 'pull_on_loading.dart';
//import 'pull_to_refresh.dart';
//import 'pull_down_refresh_pull_up_load.dart';
import 'gridview_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}


