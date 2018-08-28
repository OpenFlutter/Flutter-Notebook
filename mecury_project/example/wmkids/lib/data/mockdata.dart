abstract class JsonString {
  static final String mockdata = ''' {
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
  "score" : 111,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html"
}''';

  static final String nulltestdata = '''
  {
  "hello":0
  }
  ''';

  static final String nulltestdata2 = '''
  {
                "uuid": "283d10f832de427cad27f7552031b783",
                "entityNo": null,
                "createTime": "2018-07-09 08:04:33",
                "salesManId": null,
                "areaId": null,
                "name": "干锅类",
                "image": null,
                "state": true,
                "vendorUuid": "ad7dc50c662f4118a502ac123773c022",
                "position": 2,
                "type": 1
            }
  ''';
}
