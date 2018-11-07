import 'package:flutter/material.dart';
import 'blocs/bloc_provider.dart';

class UnderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Under Page'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (context, snapshot) => Text(
                  "You hit me: ${snapshot.data} times",
                  style: Theme.of(context).textTheme.display1,
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
