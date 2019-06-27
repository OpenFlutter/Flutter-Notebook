import 'package:flutter/material.dart';

class Week30 extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier(0);
  final ColorProvider _colorProvider = ColorProvider(ColorModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, int value, _) {
                  return Text('current counter is : $value');
                }),
            ValueListenableBuilder<ColorModel>(
              valueListenable: _colorProvider,
              builder: (context, model, _) {
                return Container(
                  height: 100,
                  width: 100,
                  color: model.color,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _counter.value++;
        _colorProvider.changeColor();
      }),
    );
  }
}

class ColorModel {
  final List<Color> _colors = [
    Colors.redAccent,
    Colors.lightGreen,
    Colors.pinkAccent,
    Colors.tealAccent,
    Colors.blue,
  ];
  int _currentColor = 0;

  get color => _colors[_currentColor];

  changeColor() {
    if (_currentColor != _colors.length - 1)
      _currentColor++;
    else
      _currentColor = 0;
  }
}

class ColorProvider extends ValueNotifier<ColorModel> {
  ColorProvider(ColorModel value) : super(value);

  changeColor() {
    value.changeColor();
    notifyListeners();
  }
}
