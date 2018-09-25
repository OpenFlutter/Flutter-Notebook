/**
 * 实现原理：首先我们需要一个RepaintBoundary Widget，并将它包裹在我们需要 toImage的Widget 当中，
 * 并给它一个 GlobalKey ，
 * 然后我们将实现一个_capturePng()方法，
 * 首先让 RenderRepaintBoundary 对象通过 GlobalKey 获取 RepaintBoundary Widget 的子树的RenderObject
 * 然后我们可以使用 RenderRepaintBoundary的toImage 方法将其转化为 Image
 * 要使用toImage，渲染对象必须经历绘制阶段（即debugNeedsPaint必须为false）。
 * 所以当我们当前页面还未加载完毕的时候，是无法进行截图的。
 * 获取原始图像数据后，我们将其转换为ByteData,然后再将ByteData转化为Uint8List
 * 之后我们只需要使用Image.memory(Uint8List)就能显示获得的图像了
 *
 * 由于我们拿到的是当前页面widget产生的renderObject，所以生成的图片也只有当前页面
 * 需要更好的理解这句话请查看another_demo
 */
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WidgetToImageDemo extends StatefulWidget {
  @override
  _WidgetToImageDemoState createState() => _WidgetToImageDemoState();
}

class _WidgetToImageDemoState extends State<WidgetToImageDemo> {
  final GlobalKey _globalKey = new GlobalKey();
  List<String> images;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    images = List<String>();
    _controller = ScrollController();
    fetchTen();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        fetchTen();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      String bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Show Image"),
            ),
            body: Container(
              child: ListView(
                children: <Widget>[
                  Image.memory(
                    pngBytes,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          );
        }));
      });
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Widget To Image demo'),
        ),
        body: ListView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: _capturePng,
          child: Icon(Icons.fullscreen),
        ),
      ),
    );
  }

  fetch() async {
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if (response.statusCode == 200) {
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  fetchTen() {
    for (int i = 0; i < 10; i++) {
      fetch();
    }
  }
}
