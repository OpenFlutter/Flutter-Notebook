import 'package:flutter/material.dart';
import 'recordable_list_view_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reorder ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReorderableListViewDemo(),
    );
  }
}
