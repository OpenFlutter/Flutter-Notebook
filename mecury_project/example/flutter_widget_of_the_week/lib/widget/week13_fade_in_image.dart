import 'package:flutter/material.dart';

class Week13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FadeInImage(
            height: 200,
            width: 200,
            fadeInDuration: Duration(seconds: 2),
            fadeInCurve: Curves.easeIn,
            placeholder: AssetImage('assets/myimage.jpg'),
            image: NetworkImage('https://media.npr.org/assets/img/2016/04/04/cat-2_sq-546ff396055da2006315af8369f7143eb18c6fd9-s800-c85.jpg')),
      ),
    );
  }
}
