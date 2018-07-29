import 'package:flutter/material.dart';
import 'package:wmkids/ui/main.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainApp(),
    );
  }
}

