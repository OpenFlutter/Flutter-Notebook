/**
 * onRecorder函数中，
 * oldIndex代表移动前item的序号
 * newIndex代表移动后item的序号
 * 由于在向后移动的时候，newIndex会因为之前的占位
 * 而多出一个，所以需要处理一下
 */
import 'package:flutter/material.dart';

class RecordableListViewDemo extends StatefulWidget {
  @override
  _RecordableListViewDemoState createState() => _RecordableListViewDemoState();
}

class _RecordableListViewDemoState extends State<RecordableListViewDemo> {
  List<String> names = [
    "LeBron James",
    "Kevin Durant",
    "Anthony Davis",
    "James Harden",
    "Stephen Curry",
    "Giannis Antetokounmopo",
    "Joel Embiid",
    "Russell Westbrook",
    "Paul George",
    "Kawhi Leonard",
    "Jeremy Shuhow Lin"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        header: PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: AppBar(title: Text('RecordableListViewDemo')),
        ),
        children: names.map((name) => _buildCard(name)).toList(),
        onReorder: _onRecorder,
      ),
    );
  }

  Widget _buildCard(String name) {
    return SizedBox(
      key: ObjectKey(name),
      height: 200,
      child: Card(
        color: Colors.lightBlueAccent.withOpacity(0.4),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onRecorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex = newIndex - 1;
    var name = names.removeAt(oldIndex);
    names.insert(newIndex, name);
    setState(() {});
  }
}
