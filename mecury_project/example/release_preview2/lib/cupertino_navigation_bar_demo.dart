import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarDemo extends StatefulWidget {
  @override
  _NavigationBarDemoState createState() => _NavigationBarDemoState();
}

class _NavigationBarDemoState extends State<NavigationBarDemo> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Text('Leading'),
//          previousPageTitle: "previousPageTitle",
          middle: Text('middle'),
          trailing: Icon(CupertinoIcons.search),
        ),
        child: Container(
        ));
  }

//  CupertinoTabBar(
//  items: const <BottomNavigationBarItem>[
//  BottomNavigationBarItem(
//  icon: Icon(CupertinoIcons.home),
//  title: Text('Home'),
//  ),
//  BottomNavigationBarItem(
//  icon: Icon(CupertinoIcons.conversation_bubble),
//  title: Text('Support'),
//  ),
//  BottomNavigationBarItem(
//  icon: Icon(CupertinoIcons.profile_circled),
//  title: Text('Profile'),
//  ),
//  ],
//  ),
}
