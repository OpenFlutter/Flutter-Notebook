/**
 * pageview 能够作出可以翻页的page
 * 需要一个pageController来控制
 * 也可以指定initPage来控制最初显示的page页面
 */
import 'package:flutter/material.dart';

class Week9 extends StatefulWidget {
  @override
  _Week9State createState() => _Week9State();
}

class _Week9State extends State<Week9> with SingleTickerProviderStateMixin{
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.5);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: <Widget>[
        Container(color: Colors.blue,),
        Container(color: Colors.pinkAccent,),
        Container(color: Colors.greenAccent,),
        Container(color: Colors.yellow,),
        Container(color: Colors.redAccent,),
      ],
    );
  }
}
