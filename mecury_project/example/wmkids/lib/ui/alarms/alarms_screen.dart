import 'package:flutter/material.dart';

class AlarmsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AlarmsScreenState();

}
class AlarmsScreenState extends State<AlarmsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarms'),
      ),
    );
  }
}