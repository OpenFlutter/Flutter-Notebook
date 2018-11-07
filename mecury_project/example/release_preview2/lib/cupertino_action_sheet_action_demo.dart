import 'package:flutter/cupertino.dart';

class ActionSheetActionDemo extends StatefulWidget {
  @override
  _ActionSheetActionDemoState createState() => _ActionSheetActionDemoState();
}

class _ActionSheetActionDemoState extends State<ActionSheetActionDemo> {
  ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  Widget buildCupertinoActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        'Provide a Cancel button',
        style: TextStyle(fontSize: 24.0),
      ),
      message: Text(
          'A Cancel button instills confidence when the user is abandoning a task. Cancel buttons should always be included in action sheets at the bottom of the screen.'),
      actions: <Widget>[
        CupertinoActionSheetAction(
            onPressed: () {}, child: Text('Close This Tab')),
        CupertinoActionSheetAction(
            onPressed: () {}, child: Text('New Private Tab')),
        CupertinoActionSheetAction(onPressed: () {}, child: Text('New Tab')),
      ],
//            messageScrollController: _controller,
      actionScrollController: _controller,
      cancelButton: CupertinoButton(child: Text('Cancel'), onPressed: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
        child: Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          child: Image.network(
            "https://fsb.zobj.net/crop.php?r=hkkFZ3-khFUeHo8GkUECNFDxUXdorexx0cMrNuek0Kf_kOgncIb2k1KoMW1CA6iWGZRWsS-59s_LX2zsuySh2BoHqh795AThAfnCZo_Sdzo9J3rnRhRyWfFMYfl9CB66BpuU2HrCLaptzhQnJsK1Twc10YDX_ecEyhhC61dNqpn_Rttn194mlq6QF9s",
            fit: BoxFit.fill,
          ),
        ),
        Center(
            child: CupertinoButton(
                child: Text('CupertinoActionSheet'),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                       return buildCupertinoActionSheet(context);
                      });
                }))
      ],
    ));
  }
}
