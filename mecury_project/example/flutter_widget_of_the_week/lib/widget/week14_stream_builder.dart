import 'dart:async';
import 'package:flutter/material.dart';

class Week14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: count(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData)
                return Center(
                    child: Text(
                  "waiting for data",
                  style: TextStyle(fontSize: 24),
                ));
              return Center(
                child: Text('${snapshot.data}',
                    style: TextStyle(fontSize: 24)),
              );
            }),
      ),
    );
  }

  Stream<int> count() async* {
    print(111);
    int i = 0;
    while (i<10000) {
      await Future.delayed(Duration(seconds: 1));
      yield i++;
    }
  }
}
