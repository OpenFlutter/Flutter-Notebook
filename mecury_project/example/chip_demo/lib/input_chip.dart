/**
 * input chip
 */

import 'package:flutter/material.dart';

class InputChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('input chip'),
      ),
      body: Center(
        child: InputChip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: Text('AB'),
            ),
            label: Text('Aaron Burr'),
            onPressed: () {
              print('I am the one thing in life.');
            },
            onDeleted: (){},
        ),
      ),
    );
  }
}
