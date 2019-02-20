import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'models/counter.dart';
import 'models/switcher.dart';
import 'first_screen.dart';

void main() {
  var counter = Counter();
  var switcher = Switcher();

  var providers = Providers();

  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<Switcher>.value(switcher));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
