/**
 * 普通chip
 * 可以自定义样式
 */
import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('chip demo'),
        ),
        body: Center(
          child: Chip(
            label: Text('CHIP'),
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: Text('01'),
            ),
            onDeleted: () {},
          ),
        ));
  }
}
