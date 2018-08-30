import 'package:flutter/material.dart';

/*
* 基础动画
* */

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _nameController,_pwController;

  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pwController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Transform(
              transform:
                  Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
              child: SafeArea(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 80.0),
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 32.0),
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    _buildTextField(_nameController, false, "name"),
                    _buildTextField(_pwController, true, "password"),
                    const SizedBox(height: 40.0),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          child: Text('login'),
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildTextField(
      TextEditingController controller, bool obscureText, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              filled: true,
            labelText: labelText,
              fillColor: Colors.white
          ),
        ),
      ),
    );
  }
}
