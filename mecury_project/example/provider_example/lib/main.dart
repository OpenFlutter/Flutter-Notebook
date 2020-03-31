import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';
import 'screens.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    MultiProvider(providers: [
      Provider<int>(
        create: (_) => textSize,
      ),
      ChangeNotifierProvider<CounterModel>.value(value: counter),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(tabs: [
            Tab(
              text: 'CounterDemo',
              icon: Icon(Icons.create),
            ),
            Tab(
              text: 'SelectorDemo',
              icon: Icon(Icons.shopping_cart),
            ),
            Tab(
              text: 'SelectorUpdateDemo',
              icon: Icon(Icons.sentiment_satisfied),
            ),
          ]),
          body: TabBarView(
            children: [
              FirstScreen(),
              GoodsListScreen(),
              OrderListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
