import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int value = 0;

  increment(){
    value++;
    notifyListeners();
  }
}