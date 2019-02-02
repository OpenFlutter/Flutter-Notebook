/**
 * FutureBuilder非常适合处理异步数据
 * 它接收一个future，并通过builder生成一个AsyncSnapshot<T>
 * 建议再使用时指定其范型类型，避免后期类型推断失败
 * 你可以通过snapshot的connectionState来判断future状态
 * 从而展现出不同的样式
 * 你还可以通过指定initialData来给asyncSnapshot一个初始值
 */
import 'dart:async';
import 'package:flutter/material.dart';

class Week6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FutureBuilder(
            initialData: "initdata",
            future: getWords(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('出错啦');
                  }
                  return Text('${snapshot.data}');
                default:
                  return null;
              }
            }),
      ),
    );
  }

  Future<String> getWords() async {
    final words = Future.delayed(Duration(seconds: 1)).then((_) {
      return "hello world";
    });
    return words;
  }
}
