/**
 * floatingActionButton可以通过FloatingActionButtonLocation
 * 来控制自己的位置，配合BottomAppBar使用
 * BottomAppBar的 shape属性能够控制是否出现半圆边距
 */
import 'package:flutter/material.dart';

class Week8 extends StatefulWidget {
  @override
  _Week8State createState() => _Week8State();
}

class _Week8State extends State<Week8> {
  var locationIndex = 0;
  List locations = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: switchLocation,
        child: Icon(Icons.track_changes),
      ),
      floatingActionButtonLocation: locations[locationIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Container(
          height: 60,
        ),
      ),
    );
  }

  switchLocation(){
    if(locationIndex == 3) locationIndex = 0;
    else locationIndex++;
    setState(() {});
  }
}

