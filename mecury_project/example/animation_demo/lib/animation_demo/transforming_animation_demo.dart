import 'package:flutter/material.dart';

/*
* 从正方形逐渐变成圆形的动画
* */

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration:Duration(seconds: 5));
    animation = BorderRadiusTween(
        begin:BorderRadius.circular(0.0),
        end: BorderRadius.circular(120.0)
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: AnimatedBuilder(animation: animationController, builder: (BuildContext context, Widget child){
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: animation.value,
                color: Colors.blue
              ),
              width: 200.0,
              height: 200.0,
              child: Text(animation.value.toString()),
            ),
          );
        }),
      ),
    );
  }
}
