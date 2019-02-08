import 'package:flutter/material.dart';

class Week19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'tooltip',
      verticalOffset: MediaQuery.of(context).size.height/3,
      child: Scaffold(),
    );
  }
}
