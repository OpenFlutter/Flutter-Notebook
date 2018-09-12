import 'package:flutter/material.dart';
import 'package:sliver_demo/pull_on_loading.dart';

class SliverScreen extends StatefulWidget {
  @override
  _SliverScreenState createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Sliver Demo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                background: Image.network(
                  "http://img18.3lian.com/d/file/201710/18/ec3bd5688eb5ba23c8a44804428d7c74.jpg",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
//            indicatorColor: Colors.lightBlue,
            labelColor: Colors.lightBlue,
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          body: TabBarView(
            children: [
//              MyHomePage(),
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    ));
  }
}
