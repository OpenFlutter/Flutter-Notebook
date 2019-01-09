/**
 * SafeArea能够自动检测异型屏
 * 并添加边距保证child widget不会被遮挡
 * 默认 top left right bottom 四个属性都为true
 * 若想取消某一边只需要设置该属性为false即可
 * minimum属性能够添加默认边距
 */
import 'package:flutter/material.dart';

class Week1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.pinkAccent,
          ),
          Container(
            height: 200,
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
