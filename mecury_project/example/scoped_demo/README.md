# scoped_demo
## 介绍
使用Scoped共享状态的demo，让APP不同的页面也能同步状态。
详细用法请参考https://pub.dartlang.org/packages/scoped_model#-readme-tab-
## 样例
![](https://user-gold-cdn.xitu.io/2018/9/11/165c864da39b5296?w=362&h=640&f=gif&s=270132)
## 实现原理
flutter中使用树来构建UI。data也就会在Widget tree中流动。Scoped的思想就是把这些共享状态提升到顶层。
- 需要共享的状态需要继承至Model类
- 使用ScopedModel<MyModel>包在MaterialApp外形成顶层状态
- 子页面通过ScopedModelDescendant<MyModel>找到顶层装态
## 更多
- 一个更加完整的例子 from google https://github.com/flutter/samples/tree/master/shrine
- 掘金教程：https://juejin.im/post/5b97fa0d5188255c5546dcf8
- 遇到了任何问题欢迎联系1652219550a@gmail.com
## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
