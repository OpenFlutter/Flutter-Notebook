import 'package:flutter/material.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PinchZoomImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinch Zoom Image Demo'),
      ),
      body: ListView(
        children: <Widget>[
          PinchZoomImage(
            image: Image.network('https://i.imgur.com/tKg0XEb.jpg'),
            zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
          ),
          PinchZoomImage(
            image: Image(
              image:
                  CachedNetworkImageProvider(
                      'https://i.imgur.com/tKg0XEb.jpg',
                  ),
            ),
            zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
          ),
        ],
      ),
    );
  }
}
