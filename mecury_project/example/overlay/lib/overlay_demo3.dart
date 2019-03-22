/**
 * 通过renderobject获取控件中心位置
 */
import 'package:flutter/material.dart';

class OverlayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Render Demo'),),
      body: ListView.builder(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyContainer(),
            );
          }),
    );
  }
}

class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openOverlay,
      child: Container(
        alignment: Alignment.center,
        height: 200,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  void openOverlay() {
    OverlayState overlayState = Overlay.of(context);
    final RenderBox box = context.findRenderObject();
    final Offset target = box.localToGlobal(box.size.center(Offset.zero));
    final height = 100.0;
    final width = 100.0;
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: target.dy-height/2,
        left: target.dx-width/2,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Material(child: Text('${target.toString()}')),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    Future.delayed(Duration(seconds: 1)).then((_){overlayEntry.remove();});
  }
}