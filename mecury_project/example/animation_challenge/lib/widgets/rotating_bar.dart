import 'package:flutter/material.dart';
import 'dart:math';

import 'package:animation_challenge/utils/react_getter.dart';

typedef TouchCallBack = void Function(double r);

enum Style { Touch, Rotate }

//旋转按钮
class RotatingBar extends StatefulWidget {
  //距离屏幕顶部的距离
  final double dx;
  //距离屏幕左边的距离
  final double dy;
  //用于返回数据
  final TouchCallBack getAngle;
  final Style style;
  final bool getBackCenter;

  RotatingBar(
      {
      @required
      this.getAngle,
      @required this.dy,
      @required this.dx,
      this.style,
      this.getBackCenter});

  @override
  _RotatingBarState createState() => _RotatingBarState();
}

class _RotatingBarState extends State<RotatingBar> {
  //用于获取控件位置的key
  GlobalKey _key = RectGetter.createGlobalKey();
  //控件中心点
  Offset centerOffset;
  //用户触摸点
  Offset currentOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(height: 250, width: 250),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(
                  'assets/icon_control_ctrl_origin1.png',
                ),
                fit: BoxFit.cover),
            color: Colors.white.withOpacity(0.8),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.3))),
        child: RectGetter(
          key: _key,
          child: Center(
            child: GestureDetector(
              onScaleUpdate: onUserTouch,
              //用户手离开之后触发，让小圆点回到中心
              onScaleEnd: (_) => widget.getBackCenter != null
                  ? widget.getBackCenter ? getBackCenter() : {}
                  : {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  constraints: BoxConstraints.tightFor(height: 200, width: 200),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: <Widget>[
                      currentOffset != null
                          ? Positioned(
                              top: currentOffset.dy - 100,
                              left: currentOffset.dx - 100,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/icon_control_ctrl_origin.png')),
                                  ),
                                ),
                              ))
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  //通过这个函数将会根据用户触摸点以及中心点计算得到边缘位置，旋转按钮
  Offset changeOffset(double x1, double x2, double y1, double y2) {
    final x = x2 - x1;
    final y = y1 - y2;
    final g = 80 / sqrt(x * x + y * y);
    if (x >= 0 && y >= 0) {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    } else if (x <= 0 && y >= 0) {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    } else if (x <= 0 && y <= 0) {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    } else {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    }
  }

  //在用户手离开后让原点回到中心
  getBackCenter() {
    final offset = currentOffset = getCenterOffset(_key);
    currentOffset = offset;
    setState(() {});
  }

  //通过RectGetter获取中心位置
  Offset getCenterOffset(GlobalKey key) {
    Offset center = RectGetter.getRectFromKey(key).center;
    return Offset(center.dx - widget.dx + 30, center.dy - widget.dy + 20);
  }

  //获取用户触摸位置
  Offset getCurrentOffset(ScaleUpdateDetails details) {
    Offset tap = details.focalPoint;
    return Offset(tap.dx - widget.dx + 30, tap.dy - widget.dy + 40);
  }

  //计算角度然后返回出去
  getAngle(double x1, double x2, double y1, double y2) {
    var angle = 0.0;
    final dx = x2 - x1;
    final dy = y2 - y1;
    if (x2 == x1) {
      angle = pi / 2.0;
      if (y2 == y1)
        angle = 0.0;
      else if (y2 < y1) angle = 3.0 * pi / 2.0;
    } else if (x2 > x1 && y2 > y1)
      angle = atan(dx / dy);
    else if (x2 > x1 && y2 < y1)
      angle = pi / 2 + atan(-dy / dx);
    else if (x2 < x1 && y2 < y1)
      angle = pi + atan(dx / dy);
    else if (x2 < x1 && y2 > y1) angle = 3.0 * pi / 2.0 + atan(dy / -dx);
    return (angle * 180 / pi);
  }

  //当用户触摸
  onUserTouch(ScaleUpdateDetails details) {
    final currentTapOffset = getCurrentOffset(details);

//  这两句话能够将触摸位置转化为边缘，达到旋钮的效果
    final centerOffset = getCenterOffset(_key);

    //控制触摸方式
    if (widget.style == null) {
      currentOffset = changeOffset(centerOffset.dx, currentTapOffset.dx,
          centerOffset.dy, currentTapOffset.dy);
    } else {
      widget.style == Style.Touch
          ? currentOffset = currentTapOffset
          : currentOffset = changeOffset(centerOffset.dx, currentTapOffset.dx,
              centerOffset.dy, currentTapOffset.dy);
    }

    //获得旋转角度
    if (widget.getAngle != null) {
      double angle = getAngle(centerOffset.dx, currentTapOffset.dx,
          centerOffset.dy, currentTapOffset.dy);
      widget.getAngle(angle);
    }

    //防止触摸超出界面
    double spacing = sqrt((centerOffset.dx-currentTapOffset.dx)*(centerOffset.dx-currentTapOffset.dx)+
        (centerOffset.dy-currentTapOffset.dy)*(centerOffset.dy-currentTapOffset.dy));
    if(spacing>90) currentOffset = changeOffset(centerOffset.dx, currentTapOffset.dx,
        centerOffset.dy, currentTapOffset.dy);

    //刷新控制点位置
    setState(() {});
  }
}
