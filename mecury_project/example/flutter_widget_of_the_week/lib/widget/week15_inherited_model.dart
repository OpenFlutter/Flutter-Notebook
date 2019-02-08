import 'package:flutter/material.dart';

class Week15 extends StatefulWidget {
  @override
  _Week15State createState() => _Week15State();
}

class _Week15State extends State<Week15> {
  @override
  Widget build(BuildContext context) {
    return MyAncestor(
      Colors.deepPurpleAccent,
      Colors.deepOrangeAccent,
      ColorRow(),
    );
  }
}

class ColorRow extends StatefulWidget {
  @override
  _ColorRowState createState() => _ColorRowState();
}

class _ColorRowState extends State<ColorRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ColorWidget1(),
            ColorWidget2(),
          ],
        ),
      ),
    );
  }
}

class ColorWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor =
        InheritedModel.inheritFrom<MyAncestor>(context, aspect: 'one');

    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: ancestor.colorOne),
    );
  }
}

class ColorWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor =
        InheritedModel.inheritFrom<MyAncestor>(context, aspect: 'two');

    return Container(
      height: 100,
      width: 100,
      color: ancestor.colorTwo,
    );
  }
}

class MyAncestor extends InheritedModel<String> {
  final Color colorOne;
  final Color colorTwo;

  const MyAncestor(this.colorOne, this.colorTwo, Widget child)
      : super(child: child);

  @override
  bool updateShouldNotify(MyAncestor oldWidget) {
    return colorOne != oldWidget.colorOne || colorTwo != oldWidget.colorTwo;
  }

  @override
  bool updateShouldNotifyDependent(
      MyAncestor oldWidget, Set<String> dependencies) {
    if (dependencies.contains('one') && colorOne != oldWidget.colorOne)
      return true;
    if (dependencies.contains('two') && colorTwo != oldWidget.colorTwo)
      return true;
    return false;
  }
}
