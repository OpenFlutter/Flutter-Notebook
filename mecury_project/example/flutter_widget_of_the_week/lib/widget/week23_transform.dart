import 'dart:math';
import 'package:flutter/material.dart';

class Week23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.rotate(
            origin: Offset(100, 100),
            angle: pi / 4,
            child: Text('Transform.rotate'),
          ),
          Transform.scale(
            origin: Offset(-100, -300),
            scale: 0.5,
            child: Text('Transform.scale'),
          ),
          Transform.translate(
            offset: Offset(100, -100),
            child: Text('Transform.translate'),
          ),
          Transform(
            transform: Matrix4.skew(-0.3, 0),
            child: Text('Matrix4.skew'),
          ),
          Transform(
            transform: Matrix4.identity()..setEntry(3, 2, 0.01)..rotateX(0.3),
          alignment: FractionalOffset.center,
            child: Text('Matrix4.identity'),
          )
        ],
      ),
    );
  }
}
