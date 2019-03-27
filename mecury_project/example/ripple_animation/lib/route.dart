import 'package:flutter/material.dart';

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget screen;

  FadeRouteBuilder({@required this.screen})
      : super(
    pageBuilder: (context, animation1, animation2) => screen,
    transitionsBuilder: (context, animation1, animation2, child) {
      return FadeTransition(opacity: animation1, child: child);
    },
  );
}