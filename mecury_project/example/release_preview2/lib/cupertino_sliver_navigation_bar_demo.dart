import 'package:flutter/cupertino.dart';
import 'package:random_pk/random_pk.dart';

class SliverNavigationBarDemo extends StatefulWidget {
  @override
  _SliverNavigationBarDemoState createState() => _SliverNavigationBarDemoState();
}

class _SliverNavigationBarDemoState extends State<SliverNavigationBarDemo> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text('Title'),
                leading: Text('Leading'),
                previousPageTitle: "previousPageTitle",
                middle: Text('middle'),
                trailing: Icon(CupertinoIcons.search),
              ),
            ];
          },
          body: CupertinoScrollbar(
            child: ListView(
                children: <Widget>[
                  RandomContainer(
                    height: height/5,
                    width: width,
                  ),
                  RandomContainer(
                    height: height/5,
                    width: width,
                  ),
                  RandomContainer(
                    height: height/5,
                    width: width,
                  ),
                  RandomContainer(
                    height: height/5,
                    width: width,
                  ),
                  RandomContainer(
                    height: height/5,
                    width: width,
                  ),
                  RandomContainer(
                    height: height/5,
                    width: width,
                  ),
                ],
            ),
          ),
    ));
  }
}
