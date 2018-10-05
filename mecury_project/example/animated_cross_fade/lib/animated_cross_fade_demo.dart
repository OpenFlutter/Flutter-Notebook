import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _first = false;

  change(){
    setState(() {
      _first = _first ? false:true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: change,
        child: AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0),
          secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
          crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}

