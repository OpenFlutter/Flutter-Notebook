import 'package:flutter/material.dart';

class ColorModel with ChangeNotifier {
  int _seed = 0xFFFF9000;
  Color _color = Color(0xFFFF9000);

  get color => _color;

  changeColor() {
    _seed += 30;
    _color = Color(_seed);
    notifyListeners();
  }
}
