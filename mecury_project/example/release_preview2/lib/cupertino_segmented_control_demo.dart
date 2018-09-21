import 'package:flutter/cupertino.dart';

class SegmentedControlDemo extends StatefulWidget {
  @override
  _SegmentedControlDemoState createState() => _SegmentedControlDemoState();
}

class _SegmentedControlDemoState extends State<SegmentedControlDemo> {
  Map<String,Widget> selectMap;
  String _select;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  selectMap = Map();
  selectMap["map"] = Text('Map');
  selectMap["transit"] = Text('Transit');
  selectMap['satellite'] = Text('Satellite');
//  _select = "";
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
        child: Center(
          child: Container(
            width: width,
            height: height/4,
            child: CupertinoSegmentedControl(
                children: selectMap,
                groupValue: _select,
                onValueChanged: (String key){
                  setState(() {
                    _select = key;
                  });
                }),
          ),
        ));
  }
}
