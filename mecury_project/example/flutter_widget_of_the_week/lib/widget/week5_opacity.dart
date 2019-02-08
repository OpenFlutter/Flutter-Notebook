/**
 * Opacity小部件能够让child部件呈现出透明效果
 * 当opacity值为0时，将会直接不显示这个child部件
 * 但是会占位
 * 当opacity值为1时，将会完全显示这个child部件
 * 当值在0.0~1.0之间时，opacity小部件将会先
 * 绘制到中间缓存区然后合成之后再生成最终的小部件
 * 这样通常会比0.0/1.0消耗更多性能
 */

import 'package:flutter/material.dart';

class Week5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: Container(
            height: 300,
            width: 300,
            child: Image.asset('assets/myimage.jpg'),
          ),
        ),
        Center(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white,
                    Colors.black,
                  ])),
            ),
          ),
        ),
      ],
    );
  }
}
