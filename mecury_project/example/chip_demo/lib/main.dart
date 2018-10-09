/**
 * 请通过切换home的注释分别查看
 */
import 'package:flutter/material.dart';
import 'chip.dart';
import 'input_chip.dart';
import 'choice_chip.dart';
import 'filter_chip.dart';
import 'action_chip.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.light(),
      home: ChipDemo(),
//      home: ActionChipDemo(),
//      home: FilterChipDemo(),
//      home: ChoiceChipDemo(),
//      home: InputChipDemo(),
    );
  }
}

