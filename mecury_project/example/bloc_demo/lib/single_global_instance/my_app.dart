import 'package:flutter/material.dart';
import 'top_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Streams Demo',
        theme: ThemeData.dark(),
        home: TopPage(),
    );
  }
}