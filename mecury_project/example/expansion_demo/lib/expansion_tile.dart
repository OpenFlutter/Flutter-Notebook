/**
 *最基础的展开小部件expansion tile
 * 用法很简单，将需要被展开的部件放在children中即可
 * 其他用法和list tile很相似
 * 当expansion tile 被展开时，我们可以看到background color
 * 会进行一个transition动画进行过渡
 * expansion tile还有一个trailing属性，代表右边的小箭头
 * 可以自行替换
 * initiallyExpanded代表最初的状态是否被展开
 * 默认为false，也就是不展开
 *
 * 当一个list view中由多个expansion tile的时候
 * 需要给每一个expansion tile指定唯一的[PageStorageKey]
 * 以保证在滑动的过程中，能够记住expansion tile的开关状态
 */

import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expansion tile demo'),),
      body: Center(
        child: ExpansionTile(
            title: Text('Expansion Tile'),
            leading: Icon(Icons.ac_unit),
            backgroundColor: Colors.white12,
            children: <Widget>[
              ListTile(
                title: Text('list tile'),
                subtitle: Text('subtitle'),
              ),
            ],
//          initiallyExpanded: true,
        ),
      ),
    );
  }
}

