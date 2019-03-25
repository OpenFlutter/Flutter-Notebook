import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Week28 extends StatefulWidget {
  @override
  _Week28State createState() => _Week28State();
}

class _Week28State extends State<Week28> {
  List list = List.generate(20, (index) => 'This is No.$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(color: Colors.redAccent),
              secondaryBackground: Container(color: Colors.blue),
              confirmDismiss: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                } else {
                  print('start to end');
                }
                list.removeAt(index);
                setState(() {});
              },
              dragStartBehavior: DragStartBehavior.start,
              key: ValueKey('${list[index]}'),
              child: ListTile(
                title: Text('${list[index]}'),
              ),
            );
          }),
    );
  }
}
