import 'package:flutter/material.dart';

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
        end: BorderRadius.circular(150.0)
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(animation: animationController, builder: (BuildContext context, Widget child){
        return Center(
          child: Material(
            borderRadius: animation.value,
            child: Container(
              color: Colors.lightBlue,
              width: 200.0,
              height: 200.0,
            ),
          ),
        );
      }),
    );
  }
}
