import 'package:flutter/material.dart';
import 'tools/bus.dart';
import 'events/count_events.dart';
import 'sceeens/first_screen.dart';

void main(){
  runApp(App());
  behaviorBus.fire(CountEvent(0));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: FirstScreen(),

    );
  }
}