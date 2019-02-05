/**
 * fadeTransition能够通过Animation改变opacity
 */
import 'package:flutter/material.dart';

class Week7 extends StatefulWidget {
  @override
  _Week7State createState() => _Week7State();
}

class _Week7State extends State<Week7> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool fadeIn = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          if(fadeIn) _controller.forward();
          else _controller.reverse();
          fadeIn = !fadeIn;
        },
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}
