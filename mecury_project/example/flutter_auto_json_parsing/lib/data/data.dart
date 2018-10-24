import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  @JsonKey(nullable: false)
  final String url;

  Data({this.by, this.descendants, this.id, this.kids, this.score, this.time,
    this.title, this.type, this.url});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}