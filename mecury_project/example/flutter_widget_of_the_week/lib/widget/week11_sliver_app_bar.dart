/**
 * SliverAppBar能够让我们很酷炫的定制顶部
 * 它需要被放在CustomScrollView或者NestScrollView中使用
 * 其中 expandedHeight 和 flexibleSpace 通常一起使用
 * 以达到不同高度显示不同样式的效果
 */

import 'package:flutter/material.dart';

class Week11 extends StatefulWidget {
  @override
  _Week11State createState() => _Week11State();
}

class _Week11State extends State<Week11> with SingleTickerProviderStateMixin{
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          title: Text('SliverAppBar'),
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network('https://www.patiliyo.com/wp-content/uploads/2016/10/kasli-kedi-patiliyo-8.jpg',fit: BoxFit.cover,),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate([
          Container(height: 100,color: Colors.deepOrangeAccent,),
          Container(height: 200,color: Colors.blue,),
          Container(height: 300,color: Colors.greenAccent,),
          Container(height: 400,color: Colors.deepPurpleAccent,),
          Container(height: 500,color: Colors.yellow,),
        ])),
      ],
    );
  }
}

