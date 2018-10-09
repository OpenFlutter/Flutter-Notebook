/**
 * filter chip在被选中时会出来一个勾勾
 * 有两点需要注意
 * selected接受一个bool，代表当前是否被选中
 * onSelected方法会自动传入一个bool，从true开始，true->false->true交替
 */
import 'package:flutter/material.dart';

class FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('filter chip demo'),),
      body: Center(
        child: FilterChip(
            label: Text('FILTER CHIP'),
          selected: _isSelected,
          onSelected: (isSelected){
            setState(() {
              _isSelected = isSelected;
            });
          },
          selectedColor: Colors.blue.shade400,),
      ),
    );
  }
}
