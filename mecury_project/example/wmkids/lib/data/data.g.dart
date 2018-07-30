// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => new Data(
    by: json['by'] as String,
    descendants: json['descendants'] as int,
    id: json['id'] as int,
    kids: (json['kids'] as List)?.map((e) => e as int)?.toList(),
    score: json['score'] as int,
    time: json['time'] as int,
    title: json['title'] as String,
    type: json['type'] as String,
    url: json['url'] as String);

abstract class _$DataSerializerMixin {
  String get by;
  int get descendants;
  int get id;
  List<int> get kids;
  int get score;
  int get time;
  String get title;
  String get type;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'by': by,
        'descendants': descendants,
        'id': id,
        'kids': kids,
        'score': score,
        'time': time,
        'title': title,
        'type': type,
        'url': url
      };
}
