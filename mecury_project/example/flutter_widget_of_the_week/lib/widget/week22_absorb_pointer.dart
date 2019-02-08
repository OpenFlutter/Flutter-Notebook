import 'package:flutter/material.dart';

class Week22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: true,
        ignoringSemantics: true,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              print('button tapped');
            },
            child: Text('RaisedButton'),
          ),
        ),
      ),
    );
  }
}
