/**
 * 当HeroAnimation作为app的home属性提供时，
 * MaterialApp会隐式推送起始路径。
 * InkWell包装图像，使得向源和目标英雄添加轻击手势变得非常简单。
 * 使用透明颜色定义“材质”窗口小部件可使图像在飞往目标时“弹出”背景。
 * SizedBox指定动画开始和结束时英雄的大小。
 * 将图像的fit属性设置为BoxFit.contain，可确保图像在过渡期间尽可能大，
 * 而不会更改其纵横比。
 */
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SourceHeroPage extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'http://pic1.win4000.com/wallpaper/e/537ebd9b60603.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<Null>(
                builder: (BuildContext context) => DestinationHeroPage()));
          },
        ),
      ),
    );
  }
}

class DestinationHeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flippers Page'),
      ),
      body: Container(
        // The blue background emphasizes that it's a new route.
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: PhotoHero(
          photo: 'http://pic1.win4000.com/wallpaper/e/537ebd9b60603.jpg',
          width: 100.0,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
