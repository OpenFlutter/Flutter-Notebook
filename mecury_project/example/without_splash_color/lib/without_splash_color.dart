/**
 * 使用局部theme强制设置splash color和highlight color为 Colors.transparent
 * splashColor: Colors.transparent,
 * highlightColor: Colors.transparent),
 *
 * brightness: Theme.of(context).brightness,确保与appTheme主题一致
 */
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('With out splash color demo'),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            brightness: Theme.of(context).brightness,

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text('123')),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text('123')),
        ],
        ),
      ),
    );
  }
}
