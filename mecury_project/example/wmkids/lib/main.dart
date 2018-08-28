import 'package:flutter/material.dart';
import 'package:wmkids/ui/main.dart';
import 'package:wmkids/ui/demo/cupertino_picker_demo.dart';
import 'package:wmkids/ui/test/chip_demo.dart';
import 'package:wmkids/ui/test/chip_test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChipTest(),
//    home: ChipDemo(),
    );

  }
}

