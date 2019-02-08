import 'package:flutter/material.dart';

class Week16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: 200,
          width: 200,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
