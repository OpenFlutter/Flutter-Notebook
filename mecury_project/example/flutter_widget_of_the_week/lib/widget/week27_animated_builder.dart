import 'dart:math';
import 'package:flutter/material.dart';

class Week27 extends StatefulWidget {
  @override
  _Week27State createState() => _Week27State();
}

class _Week27State extends State<Week27> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 2 * pi).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            _animationController.forward().then((_)=>_animationController.reverse());
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value,
                child: child,
              );
            },
            child: SizedBox(
                height: 200,
                width: 200,
                child: FlutterLogo()),
          ),
        ),
      ),
    );
  }
}
