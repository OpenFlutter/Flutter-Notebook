import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';
import 'color_model.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(
      context,
    );
    final textSize = Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text(
          'Value: ${counter.value}',
          style: TextStyle(
            fontSize: textSize.toDouble(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

/// This is a single page provider,
/// it will be destroyed when the page is removed,
/// and the status will be reset.

class SecondScreenProvider extends StatefulWidget {
  final Widget child;

  SecondScreenProvider({@required this.child});

  @override
  _SecondScreenProviderState createState() => _SecondScreenProviderState();
}

class _SecondScreenProviderState extends State<SecondScreenProvider> {
  ColorModel _colorModel = ColorModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _colorModel,
      child: widget.child,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SecondScreenProvider(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: buildAppBar(),
          body: TabBarView(children: [
            buildCounterText(),
            showIconWithColor(),
            showIconWithColor(),
          ]),
          floatingActionButton: buildActionButtons(),
        ),
      ),
    );
  }

  Column buildActionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Consumer<ColorModel>(
          builder: (context, ColorModel colorModel, child) {
            return FloatingActionButton(
              heroTag: 'no_hero',
              child: Icon(Icons.swap_horizontal_circle),
              onPressed: () {
                colorModel.changeColor();
              },
            );
          },
        ),
        SizedBox(height: 20),
        Consumer<CounterModel>(
          builder: (context, CounterModel counter, child) =>
              FloatingActionButton(
            onPressed: () => counter.increment(),
            child: child,
          ),
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  Consumer2<CounterModel, int> buildCounterText() {
    return Consumer2<CounterModel, int>(
      builder: (context, CounterModel counter, int textSize, child) {
        return Center(
          child: Text(
            'Value: ${counter.value}',
            style: TextStyle(
              fontSize: textSize.toDouble(),
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Second Page'),
      bottom: TabBar(tabs: [
        Tab(text: 'show counter'),
        Tab(text: 'show color'),
        Tab(text: 'show color'),
      ]),
    );
  }

  Container showIconWithColor() {
    return Container(
      alignment: Alignment.center,
      child: Consumer<ColorModel>(
        builder: (context, ColorModel colorModel, child) {
          return Icon(
            Icons.stars,
            color: colorModel.color,
            size: 100,
          );
        },
      ),
    );
  }
}
