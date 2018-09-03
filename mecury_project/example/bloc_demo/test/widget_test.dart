import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:bloc_demo/model/mock/hacker_news_mock_data.dart';
import 'package:bloc_demo/model/hacker_news.dart';


void main() {
  group("hacker_news_api_story test", (){
    test("json deserialization", (){
      Story story = Story.fromJson(json.decode(mockstory));
      expect(story.url, "http://www.getdropbox.com/u/2/screencast.html");
//      print(story);
    });
  });
}
