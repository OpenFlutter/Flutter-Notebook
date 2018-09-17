import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_demo/model/count_model.dart';

class UnderScreen extends StatefulWidget {
  UnderScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UnderScreenState createState() => new _UnderScreenState();
}

class _UnderScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "${model.count}",
                style: TextStyle(fontSize: 36.0),
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => model.increment(),
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    },
//    rebuildOnChange: false,
    );
  }
}
