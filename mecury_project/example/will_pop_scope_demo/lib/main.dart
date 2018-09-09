/**
 * 这是一个捕获页面被回pop掉的demo，通过切换main中的import查看不同页面。
 * 其中包含使用WillPopScope实现提示dialog与form自带的dialog页面信息
 * 每个demo前已注明实现原理
 */
import 'package:flutter/material.dart';

import 'package:will_pop_scope_demo/will_pop_scpoe_demo.dart';
//import 'package:will_pop_scope_demo/form_pop_demo.dart';

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
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


