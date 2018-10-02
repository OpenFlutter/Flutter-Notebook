import 'dart:async';

class CountBLoC {
  int _count;
  StreamController<int> _countController;
  Stream _value;

  CountBLoC() {
    _count = 0;
    _countController = StreamController<int>();
    _countController.sink.add(0);
    _value = _countController.stream.asBroadcastStream();
  }
  Stream<int> get value => _value;

//  var transformer = StreamTransformer.fromHandlers<int,int>(
//      handleData: (value, sink){
//        sink.add(value);
//      }
//  );

  init(int initValue) {
    _count = initValue;
    _countController.sink.add(_count);
  }

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}

