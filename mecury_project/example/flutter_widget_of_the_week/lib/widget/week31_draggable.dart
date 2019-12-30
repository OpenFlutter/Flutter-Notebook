import 'package:flutter/material.dart';

class Week31 extends StatefulWidget {
  @override
  _Week31State createState() => _Week31State();
}

class _Week31State extends State<Week31> {
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Draggable<Color>(
                data: Colors.deepPurpleAccent,
                feedback: Container(
                  height: 100,
                  width: 100,
                  color: Colors.deepPurpleAccent.withOpacity(0.5),
                ),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.deepPurpleAccent,
                ),
                childWhenDragging: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: DragTarget<Color>(
                onWillAccept: (color){
                  return color == Colors.deepPurpleAccent;
                },
                builder: (context, colors, rejectedData){
                  print(colors.toString());
                  return Container(
                    height: 200,
                    width: 200,
                    color: colors.length > 0 ? colors[0] : color,
                  );
                },
                onAccept: (color){
                  setState(() {
                    this.color = color;
                  });
                },
                onLeave: (color){
                  setState(() {
                    this.color = color;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
