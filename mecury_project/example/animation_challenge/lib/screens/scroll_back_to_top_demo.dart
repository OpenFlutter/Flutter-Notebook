import 'package:flutter/material.dart';

class ScrollBackToTop extends StatefulWidget {
  @override
  _ScrollBackToTopState createState() => _ScrollBackToTopState();
}

class _ScrollBackToTopState extends State<ScrollBackToTop>
    with SingleTickerProviderStateMixin {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Back To Top Demo'),
        centerTitle: true,
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Center(
                  child: Text(
                'This is no $index',
                style: TextStyle(fontSize: 24),
              )),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: backToTop,
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }

  backToTop() {
    if (_controller.offset != 0)
      _controller.animateTo(0,
          duration: Duration(seconds: 2), curve: Curves.easeIn);
  }
}
