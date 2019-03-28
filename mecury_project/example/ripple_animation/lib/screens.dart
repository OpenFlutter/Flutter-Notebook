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
        ),
      ),
      floatingActionButton: NavigateButton(
        nextScreen: SecondScreen(),
        color: Colors.white,
        splashColor: Colors.white,
        iconColor: Colors.black,
        heroTag: 'blue',
        rangeFactor: 2.4,
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

