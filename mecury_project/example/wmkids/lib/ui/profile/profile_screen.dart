import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ProfileScreenState();

}

class ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    );
  }

}