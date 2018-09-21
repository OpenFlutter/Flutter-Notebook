import 'package:flutter/cupertino.dart';
import 'cupertino_sliver_navigation_bar_demo.dart';

class TabNavigationDemo extends StatefulWidget {
  @override
  _TabNavigationDemoState createState() => _TabNavigationDemoState();
}

class _TabNavigationDemoState extends State<TabNavigationDemo> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('Home')),
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), title: Text('Folder')),
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.photo_camera), title: Text('Photo')),
        ]),
        tabBuilder: (BuildContext context, int index){
          return CupertinoTabView(
            builder: (BuildContext context){
              return SliverNavigationBarDemo();
            },
          );
        });
  }
}
