import 'package:flutter/material.dart';

/*
* 从5倒数到0
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
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = IntTween(begin: 5,end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double textSize = 56.0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Waiting ...",style: TextStyle(fontSize: textSize),),
            AnimatedBuilder(animation: animationController, builder: (BuildContext context ,Widget child){
              return Text(animation.value.toString(),style: TextStyle(fontSize: textSize),);
            })
          ],
        ),
      ),
    );
  }
}
