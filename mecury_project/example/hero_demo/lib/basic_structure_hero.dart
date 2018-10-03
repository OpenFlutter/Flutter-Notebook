/**
 * Hero Widget其实是利用了补件动画
 * 两个尽量相似的Hero之间，使用同一个tag name来进行animation
 * 所以分为源hero与目标hero
 * 通过导入scheduler包中的timeDilation能够修改变化速度
 * 在源Hero的build函数中设定timeDilation值即可
 */
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SourceHeroPage extends StatefulWidget {
  @override
  _SourceHeroPageState createState() => _SourceHeroPageState();
}

class _SourceHeroPageState extends State<SourceHeroPage> {
  Hero _sourceHero = new Hero(
      tag: "hero tag",
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.lightBlue,
      ));

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('SourceHeroPage'),
      ),
      body: Center(
        child: GestureDetector(
            child: _sourceHero,
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DestinationHeroPage();
                  }),
                )),
      ),
    );
  }
}

class DestinationHeroPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationHeroPage> {
  Hero _destinationHero = new Hero(
      tag: "hero tag",
      child: Container(
        height: 100.0,
//        width: 400.0,
        color: Colors.blue,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DestinationHeroPage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              child: _destinationHero, onTap: () => Navigator.of(context).pop())
        ],
      ),
    );
  }
}
