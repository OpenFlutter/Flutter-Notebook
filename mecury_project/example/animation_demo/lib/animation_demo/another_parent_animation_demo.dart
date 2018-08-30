import 'package:flutter/material.dart';

/*
* 父子动画，动画中的子动画，父动画是按照X轴平移，子动画是上面的方块大小逐渐增大
* */

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation parentAnimation;
  Animation childAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    parentAnimation = Tween(begin: -0.5, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    childAnimation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: parentAnimation,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(
                parentAnimation.value * width, 0.0, 0.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: childAnimation,
                    builder: (BuildContext context, Widget child) {
                      return Container(
                        color: Colors.lightBlue,
                        width: childAnimation.value * 2,
                        height: childAnimation.value,
                      );
                    },
                  ),
                  Container(
                    color: Colors.orange,
                    width: 200.0,
                    height: 100.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
