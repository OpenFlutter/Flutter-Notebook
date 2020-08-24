import 'package:bloc_demo/rxdart/blocs/count_bloc_impl.dart';
import 'package:flutter/material.dart';

import 'under_page.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final bloc = CountBLoCImpl();

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UnderPage(
                    bloc: bloc,
                  )))),
    );
  }
}
