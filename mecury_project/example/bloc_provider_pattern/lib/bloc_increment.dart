import 'bloc_base.dart';

import 'dart:async';

class IncrementBloc implements BlocBase {
  int _counter;

  //
  // Stream to handle the counter
  //
  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  //
  // Stream to handle the action on the counter
  //
  StreamController _action = StreamController();
  //StreamSink get incrementCounter => _action.sink;

  //
  // Constructor
  //
  IncrementBloc() {
    _counter = 0;
    _action.stream.listen(_handleLogic);
  }

  incrementCounter() {
    _action.sink.add(null);
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  void dispose() {
    _action.close();
    _counterController.close();
  }
}
//EOP