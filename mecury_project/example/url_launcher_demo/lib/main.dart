/**
 * 各个demo实现要点已在原理中给出，请各位手动切换demo查看
 */
import 'package:flutter/material.dart';
import 'browser_and_webview_demo.dart';
import 'tel_and_sms_demo.dart';
import 'email_demo.dart';


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
      home: UrlLauncherDemo(),
    );
  }
}
