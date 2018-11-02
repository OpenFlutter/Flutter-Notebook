import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  Stopwatch stopwatch = new Stopwatch();

  void stopButtonPressed() {
    setState(() {
      stopwatch..stop()..reset();
    });
  }

  void rightButtonPressed() {
    setState(() {
      if(stopwatch.isRunning){
        stopwatch.stop();
      }
      else{
        stopwatch.start();
      }
    });
  }

  Widget buildButton(VoidCallback callback, Color color,
      BuildContext context, IconData icon) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.5,
        alignment: Alignment.center,
        child: RaisedButton(
          elevation: 0.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(36.0)),
          color: color,
          onPressed: callback,
          child: Container(
            width: size.width * 0.5-80.0,
            height: MediaQuery.of(context).size.width*0.15,
            child: Icon(icon,color: Colors.white,size: 32.0,),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 100.0,
                width: 100.0,
                child: stopwatch.isRunning
                    ? Center(
                        child: SpinKitWave(
                            color: Colors.black87.withOpacity(0.7), type: SpinKitWaveType.start),
                      )
                    : Image.asset("assets/recorder.png")),
            Container(
                height: 200.0,
                child: new Center(
                  child: new TimerText(stopwatch: stopwatch),
                )),
            Row(children: <Widget>[
              buildButton(
                  stopButtonPressed,
//                Colors.orangeAccent,
                  Colors.redAccent,
                  context,
                  Icons.stop),
              buildButton(
                  rightButtonPressed,
//                Colors.teal.withOpacity(0.7),
                  Colors.blueAccent,
                  context,
                  stopwatch.isRunning?Icons.pause:Icons.play_arrow),
            ]),
          ],
        ),
      ),
    );
  }
}

class TimerText extends StatefulWidget {
  TimerText({this.stopwatch});
  final Stopwatch stopwatch;

  TimerTextState createState() => new TimerTextState(stopwatch: stopwatch);
}

class TimerTextState extends State<TimerText> {
  Timer timer;
  final Stopwatch stopwatch;

  TimerTextState({this.stopwatch}) {
    timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final TextStyle timerTextStyle = const TextStyle(
        fontSize: 60.0, fontFamily: "Open Sans", fontWeight: FontWeight.w300,color: Colors.black87,);
    List<String> formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Container(child: Text("${formattedTime[0]}:", style: timerTextStyle,),width: width/4.0,),
      Container(child: Text("${formattedTime[1]}:", style: timerTextStyle,),width: width/4.1,),
      Container(child: Text("${formattedTime[2]}", style: timerTextStyle,),width: width/4.6,),
    ],);
  }
}

class TimerTextFormatter {
  static List<String> format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return [minutesStr,secondsStr,hundredsStr];
//    return "$minutesStr:$secondsStr:$hundredsStr";
  }
}
