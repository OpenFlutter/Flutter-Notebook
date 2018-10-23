import 'dart:async';

class CountBLoC {

  int _count = 0;
  var _countController = StreamController.broadcast<int>();

  Stream<int> get value => _countController.stream;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}

CountBLoC bLoC = CountBLoC();
