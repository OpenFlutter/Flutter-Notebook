import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  Stopwatch stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildRecordingStatus(),
            _buildTimerText(),
            _buildButtonRow(context),
          ],
        ),
      ),
    );
  }

  void _stopButtonPressed() {
    setState(() {
      stopwatch
        ..stop()
        ..reset();
    });
  }

  void _rightButtonPressed() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
      } else {
        stopwatch.start();
      }
    });
  }

  Widget _buildTimerText() {
    return Container(
        height: 200.0,
        child: Center(
          child: TimerText(stopwatch: stopwatch),
        ));
  }

  Widget _buildRecordingStatus() {
    return Container(
        height: 100.0,
        width: 100.0,
        child: stopwatch.isRunning
            ? Center(
                child: SpinKitWave(
                    color: Colors.black87.withOpacity(0.7),
                    type: SpinKitWaveType.start),
              )
            : Image.asset("assets/recorder.png"));
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(children: <Widget>[
      _buildButton(_stopButtonPressed, Colors.redAccent, context, Icons.stop),
      _buildButton(_rightButtonPressed, Colors.blueAccent, context,
          stopwatch.isRunning ? Icons.pause : Icons.play_arrow),
    ]);
  }

  Widget _buildButton(
      VoidCallback callback, Color color, BuildContext context, IconData icon) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.5,
        alignment: Alignment.center,
        child: RaisedButton(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
          color: color,
          onPressed: callback,
          child: Container(
            width: size.width * 0.5 - 80.0,
            height: MediaQuery.of(context).size.width * 0.15,
            child: Icon(
              icon,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ));
  }
}

class TimerText extends StatefulWidget {
  TimerText({this.stopwatch});
  final Stopwatch stopwatch;

  TimerTextState createState() => TimerTextState(stopwatch: stopwatch);
}

class TimerTextState extends State<TimerText> {
  Timer timer;
  final Stopwatch stopwatch;

  TimerTextState({this.stopwatch}) {
    timer = Timer.periodic(Duration(milliseconds: 30), callback);
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
      fontSize: 60.0,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    );
    List<String> formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            "${formattedTime[0]}:",
            style: timerTextStyle,
          ),
          width: width / 4.0,
        ),
        Container(
          child: Text(
            "${formattedTime[1]}:",
            style: timerTextStyle,
          ),
          width: width / 4.1,
        ),
        Container(
          child: Text(
            "${formattedTime[2]}",
            style: timerTextStyle,
          ),
          width: width / 4.6,
        ),
      ],
    );
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

    return [minutesStr, secondsStr, hundredsStr];
//    return "$minutesStr:$secondsStr:$hundredsStr";
  }
}
