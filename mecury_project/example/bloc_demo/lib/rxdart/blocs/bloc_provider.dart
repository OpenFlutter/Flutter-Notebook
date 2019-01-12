import 'package:flutter/material.dart';
import 'package:bloc_demo/rxdart/blocs/count_bloc.dart';

class BlocProvider extends InheritedWidget {
  final CountBLoC bLoC = CountBLoC();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;
}
