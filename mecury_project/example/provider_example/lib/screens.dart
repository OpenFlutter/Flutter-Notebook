import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context,);
    final textSize = Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text(
          'Value: ${counter.value}',
          style: TextStyle(
            fontSize: textSize.toDouble(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, child) {
          return Center(
            child: Text(
              'Value: ${counter.value}',
              style: TextStyle(
                fontSize: textSize.toDouble(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
              onPressed: () => counter.increment(),
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
