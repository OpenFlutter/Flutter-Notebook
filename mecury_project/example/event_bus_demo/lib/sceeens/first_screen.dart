import 'package:flutter/material.dart';
import '../tools/bus.dart';
import '../events/count_events.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: StreamBuilder<CountEvent>(
            stream: behaviorBus.on<CountEvent>(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text('you pushed the button ${snapshot.data.count} times')
                  : Text('waiting for data');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
