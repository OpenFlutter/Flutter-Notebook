import 'package:flutter/material.dart';
import 'custom_navigator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for Navigator',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/signup': (BuildContext context) => SignUpPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/signup');
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Text('Home Page'),
        ),
      ),
    );
  }
}






