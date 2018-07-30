import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wmkids/data/mockdata.dart';
import 'package:wmkids/data/data.dart';


void main(){
  group('jsonparse test', (){
    test('mockdata test', (){
      Data data1 = Data.fromJson(json.decode(JsonString.mockdata));
      expect(data1.url, '错误的数据');
    });
  });
}