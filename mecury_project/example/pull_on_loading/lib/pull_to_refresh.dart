/**
 * 实现原理是在ListView外套一层RefreshIndicator，并在onRefresh: ()方法中重新注入新数据
 */
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images;

  @override
  void initState() {
    super.initState();
    images = List<String>();
    fetchTen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pull to loading demo'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1));
          images.clear();
          fetchTen();
        },
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
//              constraints: BoxConstraints.tightFor(height: 150.0),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            }),
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
