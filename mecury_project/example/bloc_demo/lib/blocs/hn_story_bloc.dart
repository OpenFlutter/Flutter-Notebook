import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:bloc_demo/model/hacker_news.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StoryBloc {

  final _isLoadingSubject = BehaviorSubject<bool>(seedValue: false);
  Stream<bool> get isLoading => _isLoadingSubject.stream;
  final _storySubject = BehaviorSubject<UnmodifiableListView<Story>>();
  Stream<UnmodifiableListView<Story>> get stories => _storySubject.stream;

  List<Story> _stories = <Story>[];
  List<int> _storyIds = [
    17392995, 17397852, 17395342, 17385291, 17387851, 17395675, 17387438, 17393560, 17391971, 17392455,
  ];

  StoryBloc(){
    _updateStorys(_storyIds);
  }

  Future<Story> _getStory(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return _parseStory(storyRes.body);
    }
    return null;
  }

  Story _parseStory(String body) {
    return Story.fromJson(json.decode(body));
  }

  Future<void> _updateStorys(List<int> storyId) async {
    _isLoadingSubject.add(true);
    final futureStories = await _storyIds.map((id) => _getStory(id));
    final List<Story> stories = await  Future.wait(futureStories);
    _stories = stories;
    stories.map((story)=>print(story));
    _storySubject.add(UnmodifiableListView(_stories));
    _isLoadingSubject.add(false);
  }
}
