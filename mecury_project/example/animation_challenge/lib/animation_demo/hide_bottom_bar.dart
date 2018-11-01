import 'package:flutter/material.dart';

class HideBottomBarDemo extends StatefulWidget {
  @override
  _HideBottomBarDemoState createState() => _HideBottomBarDemoState();
}

class _HideBottomBarDemoState extends State<HideBottomBarDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  ScrollController _scrollController;
  List<String> list = List.generate(30, (index) => "this is index: $index");
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _scrollController = ScrollController(keepScrollOffset: true)
      ..addListener(() {
        if (_scrollController.offset - offset > 30.0 &&
            _animationController.status == AnimationStatus.dismissed) {
          print("监测下拉");
          offset = _scrollController.offset;
          _animationController.forward();
        }
        if (offset - _scrollController.offset > 30.0 &&
            _animationController.status == AnimationStatus.completed) {
          print("监测上拉");
          offset = _scrollController.offset;
          _animationController.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immersive BottomNavigationBar'),
      ),
      body: _buildListView(context, _scrollController),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: 0.0,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                  bottom: _animation.value, left: 0.0, right: 0.0, child: child)
            ],
          ),
        );
      },
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(Icons.title), title: Text("home")),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildListView(BuildContext context, ScrollController controller) {
    return ListView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(list[index]),
            ));
  }
}
