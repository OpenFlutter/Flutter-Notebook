import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {

  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
        body: Center(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              width: width,
              height: height/2,
              color: Colors.grey,
              child: Wrap(
                children: list,
                spacing: 24.0,
                crossAxisAlignment: WrapCrossAlignment.center,
              ),
            ),
          ),
        ),
    );
  }

  Widget buildAddButton(){
    return GestureDetector(
      onTap: (){
        if(list.length<9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}
