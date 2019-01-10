/**
 * AnimatedContainer能够实现隐式部件动画
 * 只需要改变container的值并setState
 * 就会自动创建补间动画
 * 你还可以通过curve控制动画曲线
 */
import 'package:flutter/material.dart';

class Week4 extends StatefulWidget {
  @override
  _Week4State createState() => _Week4State();
}

class _Week4State extends State<Week4> {
  Color _color = Colors.deepPurpleAccent;
  double _size = 200;
  double _radius = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[

        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: _size,
          width: _size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            color: _color,
          ),
        ),

        Wrap(
          children: <Widget>[
            FlatButton(onPressed: _changeColor, child: Text('改变颜色',style: TextStyle(color: Colors.white))),
            FlatButton(onPressed: _changeSize, child: Text('改变大小',style: TextStyle(color: Colors.white))),
            FlatButton(onPressed: _changeRadius, child: Text('改变形状',style: TextStyle(color: Colors.white))),
          ],
        )
      ],
    );
  }

  _changeColor() => setState(() {
        _color = _color == Colors.deepPurpleAccent
            ? Colors.deepOrange
            : Colors.deepPurpleAccent;
        print(_color);
      });

  _changeSize() => setState((){
        _size = _size == 200
            ? 100
            : 200;
  });

  _changeRadius() => setState((){
        _radius = _radius == 0
            ? 120
            : 0;
  });
}
