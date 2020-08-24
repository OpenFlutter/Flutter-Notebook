import 'package:bloc_demo/rxdart/top_page.dart';
/**
 * 切换注释查看single_global_instance / scoped模式的BLoC demo
 * 有两个地方需要切换，一个是导入的top_page要切换，另外一个是MyApp要切换
 */
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * scoped 入口
 */
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return BlocProvider(
//      child: MaterialApp(
//        title: 'scoped',
//        theme: ThemeData.dark(),
//        home: TopPage(),
//      ),
//    );
//  }
//}

/**
 * single_global_instance 入口
 */
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'single_global_instance',
//        theme: ThemeData.dark(),
//        home: TopPage(),
//     );
//  }
//}

/**
 * rxdart 入口
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rxdart',
      theme: ThemeData.dark(),
      home: TopPage(),
    );
  }
}
