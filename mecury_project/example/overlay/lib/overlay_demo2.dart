/**
 * 如果你的叠加层是完全不透明而且能沾满整个屏幕的话
 * 使用opaque：true 能够跳过构建原本的widget tree从而提升性能
 * 请通过注释opaque体验它的效果
 *
 * 如果就算这个叠层挡住了下面的widget了，但是你还是希望渲染下面的组件
 * 使用maintainState：true 能够强制渲染下方的widget，这个属性很昂贵，谨慎使用
 *
 * 如果你想改变叠加层的状态
 * 请在状态改变后使用overlayEntry.markNeedsBuild()它将会在下一帧重新rebuild
 * 而不是setState()
 */
import 'package:flutter/material.dart';
import 'dart:async';

class OverlayDemo extends StatefulWidget {
  @override
  _OverlayDemoState createState() => _OverlayDemoState();
}

class _OverlayDemoState extends State<OverlayDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Overlay Demo',
          style: TextStyle(fontSize: 36.0),
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
            child: Icon(Icons.fiber_smart_record),
            onPressed: () => showOverlay(context));
      }),
    );
  }

  showOverlay(BuildContext context) async {
    Color color = Colors.pinkAccent;

    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        maintainState: true,
//        opaque: true,
        builder: (context) {
          return Opacity(
            opacity: 0.5,
            child: Scaffold(
              body: Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: color,
                ),
              ),
            ),
          );
        });

    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 2));
    color = Colors.tealAccent;
    overlayEntry.markNeedsBuild();
    await Future.delayed(Duration(seconds: 2));
    overlayEntry.remove();

  }
}
