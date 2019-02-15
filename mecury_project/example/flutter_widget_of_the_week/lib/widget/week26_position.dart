import 'package:flutter/material.dart';

class Week26 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.yellow,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                  left: -50,
                  top: -50,
                  child: FlutterLogo(
                    size: 100,
                  )),
              Positioned(
                child: Text('原始的position在左上角'),
              ),
              Positioned.fill(
                  child: FlutterLogo(
                colors: Colors.teal,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
