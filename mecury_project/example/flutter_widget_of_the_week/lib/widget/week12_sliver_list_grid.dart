import 'package:flutter/material.dart';

class Week12 extends StatefulWidget {
  @override
  _Week12State createState() => _Week12State();
}

class _Week12State extends State<Week12> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            _buildContainer(Colors.deepPurpleAccent),
            _buildContainer(Colors.yellow),
            _buildContainer(Colors.blue,),
            _buildContainer(Colors.deepOrangeAccent,),
            _buildContainer(Colors.pinkAccent,),
          ]),
        ),SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 10)],
              );
            },
            childCount: 10,
          ),
        )
      ],
    );
  }

  Widget _buildContainer(Color color){
    return Container(height: 100,color: color,);
  }
}
