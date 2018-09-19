import 'dart:collection';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc_demo/model/hacker_news.dart';
import 'package:bloc_demo/blocs/hn_story_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StoryBloc storyBloc;

  @override
  void initState() {
    storyBloc = StoryBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LoadingInfo(storyBloc.isLoading),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(Duration(seconds: 2));
          storyBloc.refresh();
          },
        child: StreamBuilder<UnmodifiableListView<Story>>(
          stream: storyBloc.stories,
          initialData: UnmodifiableListView<Story>([]),
          builder: (context, snapshot) {
            return ListView(
                children: _buildList(snapshot.data)
            );
          },
        ),
      ),
    );
  }

  _buildStory(Story story) {
    return Padding(
      key: Key(story.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(story.title ?? '[null]', style: TextStyle(fontSize: 24.0)),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(story.type),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(story.url)) {
                    launch(story.url);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList(List<Story> stories){
    List<Widget> storyItem = [];
    stories.map((story){
      storyItem.add(_buildStory(story));
    });
    return storyItem;
  }
}


class LoadingInfo extends StatefulWidget {
  final Stream<bool> _isLoading;
  LoadingInfo(this._isLoading);

  createState() => LoadingInfoState();
}

class LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget._isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          _controller.forward().then((Null f) {
            _controller.reverse();
          });
          return FadeTransition(
            child: Icon(Icons.chat_bubble),
            opacity: Tween(begin: .5, end: 1.0).animate(
                CurvedAnimation(curve: Curves.easeIn, parent: _controller)),
          );
        });
  }
}
