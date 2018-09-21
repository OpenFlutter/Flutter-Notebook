import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cupertino_timer_picker_demo.dart';
import 'cupertino_segmented_control_demo.dart';
import 'cupertino_action_sheet_action_demo.dart';
import 'cupertino_navigation_bar_demo.dart';
import 'cupertino_sliver_navigation_bar_demo.dart';
import 'cupertino_tab_navigation_demo.dart';
import 'cupertino_picker_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      title: 'Flutter Demo',
      home: ActionSheetActionDemo(),
    );
  }
}

