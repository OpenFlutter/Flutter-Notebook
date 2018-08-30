import 'package:flutter/material.dart';

/*
* 单击中间方块显示隐藏按钮，双击中间方块复原
* */

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: -0.15).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Center(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                            child: Text('Buy'),
                            elevation: 7.0,
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {}),
                        SizedBox(width: 10.0),
                        RaisedButton(
                            child: Text('Details'),
                            elevation: 7.0,
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {})
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      animationController.forward();
                    },
                    onDoubleTap: (){
                      animationController.reverse();
                    },
                    child: Center(
                      child: Container(
                        color: Colors.lightBlue,
                        alignment: Alignment.bottomCenter,
                        width: 200.0,
                        height: 80.0,
                        transform: Matrix4.translationValues(0.0, animation.value * width, 0.0),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
