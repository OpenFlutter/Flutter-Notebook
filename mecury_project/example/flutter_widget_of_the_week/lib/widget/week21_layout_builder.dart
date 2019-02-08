import 'package:flutter/material.dart';

class Week21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 500)
          return ListView.builder(
              itemBuilder: (context, index) => Center(
                child: Text('$index'),
              ));
        else
          return GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                child: Text('$index'),
              ));
      }),
    );
  }
}
