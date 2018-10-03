import 'dart:async';

class CountBLoC {
  int _count;
  StreamController<int> _countController;

  CountBLoC() {
    _count = 0;
    _countController = StreamController.broadcast<int>();
  }
  Stream<int> get value => _countController.stream;

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

CountBLoC bLoC = CountBLoC();
