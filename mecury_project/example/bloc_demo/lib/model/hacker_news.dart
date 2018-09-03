import 'package:json_annotation/json_annotation.dart';

part 'hacker_news.g.dart';

@JsonSerializable()
class Story extends Object with _$StorySerializerMixin{
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;
  Story({this.by, this.descendants, this.id, this.kids, this.score, this.time,
    this.title, this.type, this.url});
  @override
  String toString() {
    return 'Story{by: $by, descendants: $descendants, id: $id, kids: $kids, score: $score, time: $time, title: $title, type: $type, url: $url}';
  }
  factory Story.fromJson(Map<String , dynamic> json) => _$StoryFromJson(json);
}