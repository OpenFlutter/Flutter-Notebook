/**
 * Expanded Widget 在row或者column或者flex中使用
 * 首先 row 和 column 会将固定大小的widget最先放入
 * 然后放入包裹了Expanded的widget
 * 它将会沿着主轴展开，默认撑满剩余空间
 * 你可以用flex 属性控制展开比例
 */

import 'package:flutter/material.dart';

class Week2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text('01'),
        ),Expanded(
          flex: 3,
          child: Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text('02'),
          ),
        ),Expanded(
          flex: 1,
          child: Container(
            color: Colors.pinkAccent,
            alignment: Alignment.center,
            child: Text('03'),
          ),
        ),
      ],
    );
  }
}
