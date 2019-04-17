import 'package:flutter/material.dart';

class Week29 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 200,),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: FlatButton(
                color: Colors.blue,
                onPressed: (){}, child: Text('BUTTON')),
          ),
          SizedBox(
            height: 200,
            child: FlatButton(
                color: Colors.green,
                onPressed: (){}, child: Text('BUTTON')),
          ),
          Container(
            height: 200,
            child: SizedBox.expand(child: FlatButton(
                color: Colors.redAccent,
                onPressed: (){}, child: Text('BUTTON')),),
          )
        ],
      ),
    );
  }

}