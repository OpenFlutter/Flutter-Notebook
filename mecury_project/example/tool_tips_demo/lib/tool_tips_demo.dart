/**
 * 一个简单的material风格的轻量操作提示控件
 * 只需要把这个tooltip包裹到一个widget的外部
 * 长按时就会弹出一个tooltip
 * tooltip必须设置message
 * 还有许多控件都有tooltip这个属性
 * 例如：[IconButton], [FloatingActionButton], 和[PopupMenuButton]
 */

import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(
        child: Tooltip(
            message: "开启飞行模式",
            child: Icon(Icons.airplanemode_inactive,),
        ),
      ),
    );
  }
}
