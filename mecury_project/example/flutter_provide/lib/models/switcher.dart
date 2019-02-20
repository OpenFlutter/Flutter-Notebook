import 'package:flutter/material.dart';

class Switcher with ChangeNotifier{
  bool status = false;

  changeStatus(){
    status = !status;
    notifyListeners();
  }
}