import 'package:flutter/material.dart';
import '../widgets/rotating_bar.dart';

class RotatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          left: size.width/4,
          top: size.height/3,
          child: RotatingBar(
            getBackCenter: true,
            dx: size.width/4,
            dy: size.height/3,
            style: Style.Touch,
            getAngle: (angle) {
              print(angle);
            },
          ),
        )
      ],
    ));
  }
}
