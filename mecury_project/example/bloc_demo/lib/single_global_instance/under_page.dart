import 'package:flutter/material.dart';
import 'blocs/count_bloc.dart';

class UnderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Page'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: bLoC.stream,
            initialData: bLoC.value,
            builder: (context, snapshot) => Text(
                  "You hit me: ${snapshot.data} times",
                  style: Theme.of(context).textTheme.display1,
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bLoC.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
