import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroDemo extends StatefulWidget {
  @override
  _HeroDemoState createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo> {
  List<String> list;

  @override
  void initState() {
    super.initState();
    list = List.generate(20, (index) => "This is no.$index");
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo1'),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: "FloatingActionButton",
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondPage())),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode,
                maxLines: 5,
                decoration: InputDecoration.collapsed(
                    hintText: 'What do you want to add now ?'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
          tag: "FloatingActionButton",
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
            child: ButtonTheme(
              height: 48.0,
              minWidth: double.infinity,
              child: RaisedButton(
                color: Colors.lightBlue,
                onPressed: () {},
                elevation: 10.0,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
