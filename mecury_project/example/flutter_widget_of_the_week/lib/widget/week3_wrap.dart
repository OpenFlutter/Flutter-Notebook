/**
 *  wrap组件能够进行水平或者垂直布局
 *  当children在布局方向上空间不够了
 *  将会自动向垂直布局方向扩充
 *
 *  direction：控制布局方向，该方向为主轴
 *  alignment：主轴对齐方式
 *  runAlignment在：副轴对齐方式
 *  spacing：主轴上child的间距
 *  runSpacing：副轴上child的间距
 *  textDirection：决定排列顺序
 */
import 'package:flutter/material.dart';

class Week3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      textDirection: TextDirection.rtl,
      children: <Widget>[
        _colorfulContainer(Colors.lightBlueAccent),
        _colorfulContainer(Colors.pinkAccent),
        _colorfulContainer(Colors.greenAccent),
        _colorfulContainer(Colors.deepOrangeAccent),
        _colorfulContainer(Colors.deepPurpleAccent),
        _colorfulContainer(Colors.lightBlueAccent),
        _colorfulContainer(Colors.pinkAccent),
        _colorfulContainer(Colors.greenAccent),
        _colorfulContainer(Colors.deepOrangeAccent),
        _colorfulContainer(Colors.deepPurpleAccent),
      ],
    );
  }

  Widget _colorfulContainer(Color color){
    return Container(
      height: 100,
      width: 100,
      color: color,
    );
  }
}
