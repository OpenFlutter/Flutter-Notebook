import 'package:flutter/material.dart';
import '../tools/bus.dart';
import '../events/count_events.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CountEvent>(
        stream: behaviorBus.on<CountEvent>(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Second Screen'),
            ),
            body: Center(
              child: snapshot.hasData
                  ? Text('you pushed the button ${snapshot.data.count} times')
                  : Text('waiting for data'),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              if (snapshot.hasData)
                behaviorBus.fire(CountEvent(snapshot.data.count + 1));
            },
            child: Icon(Icons.add),
            ),
          );
        });
  }
}
