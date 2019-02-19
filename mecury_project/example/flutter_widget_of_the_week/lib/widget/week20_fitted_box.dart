import 'package:flutter/material.dart';

class Week20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          color: Colors.deepOrangeAccent,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
            child: Container(
              height: 1,
              width: 1,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ),
    );
  }
}
