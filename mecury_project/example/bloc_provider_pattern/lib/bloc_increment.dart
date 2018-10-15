import 'dart:async';

import './bloc_base.dart';

class IncrementBloc implements BlocBase {
  int _counter;

  StreamController<int> _counterPipe = StreamController<int>();
  Stream<int> get outCounter => _counterPipe.stream;

  IncrementBloc() {
    _counter = 0;
    //_counterPipe 用于StreamBuilder，已经自动加了listen
  }

  incrementCounter() {
    _counter = _counter + 1;
    _counterPipe.sink.add(_counter);
  }

  void dispose() {
    print('bloc disposed!');
    _counterPipe.close();
  }
}
