import 'package:flutter/material.dart';

//import 'pull_on_loading.dart';
//import 'pull_to_refresh.dart';
import 'pull_down_refresh_pull_up_load.dart';

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


