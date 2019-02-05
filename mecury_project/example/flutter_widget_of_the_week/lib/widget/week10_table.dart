/**
 * column 和 row都同时存在且不需要滑动的时候
 * 你可以使用table
 * table小部件接收一堆TableRow代表每行
 * 每行小部件所占比例由columnWidths控制
 * columnWidths接收一个map<int,TableColumnWidth>
 * 代表了改行上下标所对应的小部件所占比例
 * 默认为1.0也就是平均分
 * 你可以通过defaultVerticalAlignment控制row对齐方式
 * 在TableRow中你可以通过decorate去设置背景颜色
 */

import 'package:flutter/material.dart';

class Week10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        border: TableBorder(top: BorderSide(color: Colors.black, width: 48)),
        columnWidths: {
          0: FractionColumnWidth(0.2),
          1: FractionColumnWidth(0.3),
        },
        children: [
          _buildTableRow(
              Colors.redAccent, Colors.blueAccent, Colors.tealAccent),
          _buildTableRow(Colors.blue, Colors.yellow, Colors.pinkAccent),
          _buildTableRow(Colors.lightGreen, Colors.purpleAccent, Colors.teal),
        ],
      ),
    );
  }

  _buildTableRow(color1, color2, color3) {
    return TableRow(
        decoration:
            BoxDecoration(color: Colors.deepOrangeAccent.withOpacity(0.4)),
        children: [
          Container(
            height: 200,
            width: 100,
            color: color1,
            alignment: Alignment.center,
            child: Text("0"),
          ),
          Container(
            height: 100,
            width: 100,
            color: color2,
            alignment: Alignment.center,
            child: Text("1"),
          ),
          Container(
            height: 100,
            width: 100,
            color: color3,
            alignment: Alignment.center,
            child: Text("2"),
          ),
        ]);
  }
}
