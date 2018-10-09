/**
 * choice chip主要有两点需要注意
 * selected接受一个bool，代表当前是否被选中
 * onSelected方法会自动传入一个bool，从true开始，true->false->true交替
 */
import 'package:flutter/material.dart';

class ChoiceChipDemo extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('choice chip demo'),),
      body: Center(
        child: ChoiceChip(
          label: Text('choice chip'),
          selected: _isSelected,
          onSelected: (isSelected){
            setState(() {
              _isSelected = isSelected;
            });
          },
          selectedColor: Colors.blue.shade400,
        ),
      ),
    );
  }
}
