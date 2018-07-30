import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_auto_json_parsing/data/data.dart';
import 'package:flutter_auto_json_parsing/data/mockdata.dart';


void main(){
  group('jsonparse test', (){
    test('mockdata test', (){
      Data data1 = Data.fromJson(json.decode(JsonString.mockdata));
      expect(data1.url, '错误的数据');
    });
  });
}