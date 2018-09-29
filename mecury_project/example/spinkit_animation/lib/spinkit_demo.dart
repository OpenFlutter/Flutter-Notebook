import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.white),
                SpinKitRotatingPlain(color: Colors.white),
                SpinKitChasingDots(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.white),
                SpinKitPulse(color: Colors.white),
                SpinKitDoubleBounce(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: Colors.white),
                SpinKitWanderingCubes(color: Colors.white),
                SpinKitWanderingCubes(
                    color: Colors.white, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: Colors.white),
                SpinKitFadingFour(color: Colors.white),
                SpinKitFadingFour(
                    color: Colors.white, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.white),
                SpinKitCubeGrid(size: 51.0, color: Colors.white),
                SpinKitFoldingCube(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.white),
                SpinKitDualRing(color: Colors.white),
                SpinKitRipple(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.white),
                SpinKitFadingGrid(
                    color: Colors.white, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.white),
                SpinKitSpinningCircle(
                    color: Colors.white, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: Colors.white),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
