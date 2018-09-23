import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class LoadImageDemo extends StatefulWidget {
  @override
  _LoadImageDemoState createState() => _LoadImageDemoState();
}

class _LoadImageDemoState extends State<LoadImageDemo> {

  List<Asset> images = List<Asset>();
  String _error;

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });
    List resultList;
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on PlatformException catch (e) {
      _error = e.message;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (_error == null) _error = 'No Error Dectected';
    });
  }

  Widget builtImage(Asset asset){
    if (asset.thumbData != null) {
      return Image.memory(
        asset.thumbData.buffer.asUint8List(),
        fit: BoxFit.cover,
        gaplessPlayback: true,
      );
    }
    return Container();
  }

  void _loadImage(Asset asset) async {
    await asset.requestThumbnail(300, 300);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoadImageDemo'),),
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context,index){
            _loadImage(images[index]);
            return builtImage(images[index]);
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: loadAssets,
          child: Icon(Icons.image),
      ),
    );
  }
}
