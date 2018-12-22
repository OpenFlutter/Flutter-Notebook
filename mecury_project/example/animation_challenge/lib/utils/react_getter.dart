import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 需要实时获得某个Widget的Rect信息时使用该控件
/// 可选传GlobalKey和无参两种构造方式，之后利用对象本身或者构造传入的key以获取信息
/// Use this widget to get a widget`s rectangle information in real-time .
/// It has 2 constructors , pass a globalkey or use default key , and then
/// you can use the key or object itself to get info .

class RectGetter extends StatefulWidget {
  final GlobalKey<_RectGetterState> key;
  final Widget child;

  /// 持有某RectGetter对象的key时利用该方法获得其child的rect
  /// Use this static method to get child`s rectangle information when had a custom globalkey
  static Rect getRectFromKey(GlobalKey<_RectGetterState> globalKey) {
    var object = globalKey?.currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null)?.getTranslation();
    var size = object?.semanticBounds?.size;

    if (translation != null && size != null) {
      return new Rect.fromLTWH(translation.x, translation.y, size.width, size.height);
    } else {
      return null;
    }
  }

  /// create a custom globalkey , use this way to avoid type exception in dart2 .
  static GlobalKey<_RectGetterState> createGlobalKey() {
    return new GlobalKey<_RectGetterState>();
  }

  /// 传GlobalKey构造，之后可以RectGetter.getRectFromKey(key)的方式获得Rect
  /// constructor with key passed , and then you can get child`s rect by using RectGetter.getRectFromKey(key)
  RectGetter({@required this.key, @required this.child}) : super(key: key);

  /// 生成默认GlobalKey的命名无参构造，调用对象的getRect方法获得Rect
  /// Use defaultKey to build RectGetter , and then use object itself`s getRect() method to get child`s rect
  factory RectGetter.defaultKey({@required Widget child}) {
    return new RectGetter(
      key: new GlobalKey(),
      child: child,
    );
  }

  Rect getRect() {
    return getRectFromKey(this.key);
  }

  /// 克隆出新对象实例，避免同一GlobalKey在组件树上重复出现导致的问题
  /// make a clone with different GlobalKey
  RectGetter clone() {
    return new RectGetter.defaultKey(
      child: this.child,
    );
  }

  @override
  _RectGetterState createState() => new _RectGetterState();
}

class _RectGetterState extends State<RectGetter> {
  @override
  Widget build(BuildContext context) => widget.child;
}