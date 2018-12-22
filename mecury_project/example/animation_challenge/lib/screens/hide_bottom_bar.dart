import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideBottomBarDemo extends StatefulWidget {
  @override
  _HideBottomBarDemoState createState() => _HideBottomBarDemoState();
}

class _HideBottomBarDemoState extends State<HideBottomBarDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  ScrollController _scrollController;

  void _judgeScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _animationController.forward();
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _scrollController = ScrollController(keepScrollOffset: true)
      ..addListener(_judgeScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController?.dispose();
    _scrollController..removeListener(_judgeScroll);
    // 如果销毁ScrollController，keepScrollOffset将置空
    // _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immersive BottomNavigationBar'),
      ),
      body: _buildListView(),
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

  Widget _buildListView() => ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("this is index: $index"),
          ));

}
