import 'package:flutter/material.dart';
import 'navigate_button.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstScreen'),
      ),
      body: Center(
        child: NavigateButton(
          nextScreen: SecondScreen(),
          color: Colors.blueAccent,
          splashColor: Colors.blueAccent,
//          rangeFactor: 3,
        ),
      ),
      floatingActionButton: NavigateButton(
        nextScreen: SecondScreen(),
        color: Colors.white,
        splashColor: Colors.white,
        iconColor: Colors.black,
        heroTag: 'blue',
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
    );
  }
}

