import 'dart:async';

import 'package:flutter/material.dart';

class ImScreen extends StatefulWidget {
  @override
  _ImScreenState createState() => _ImScreenState();
}

class _ImScreenState extends State<ImScreen> {
  StreamController _messageController;
  TextEditingController _textController;
  List _myMessages;
  final _myName = "Vadaski";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageController = StreamController();
    _textController = TextEditingController();
    _myMessages = List();
  }

  @override
  void dispose() {
    _textController.dispose();
    _messageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IM Challenge'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: _myMessages.length,
                    itemBuilder: (context, index) {
                      return _buildMessageWidget(_myMessages[index], context);
                    })),
            Divider(
              height: 1.0,
            ),
            _buildInputWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputWidget(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
                child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: "Send your message"),
              controller: _textController,
              onChanged: onMessageChanged,
              onSubmitted: onMessageSubmit,
            )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: StreamBuilder(
                initialData: "",
                stream: _messageController.stream,
                builder: (context, snapshot) {
                  return IconButton(
                    icon: Icon(
                      Icons.send,
                      color: snapshot.data == ""
                          ? Colors.grey
                          : Theme.of(context).accentColor,
                    ),
                    onPressed: () => onMessageSubmit(_textController.text),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessageWidget(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(_myName, style: Theme.of(context).textTheme.subhead),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue.withOpacity(0.2)),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              child: Text(_myName[0]),
            ),
          ),
        ],
      ),
    );
  }

  onMessageChanged(String message) {
    _messageController.sink.add(message);
  }

  onMessageSubmit(String message) {
    _textController.clear();
    if (message != "") {
      setState(() {
        _myMessages.insert(0, message);
      });
    }
    onMessageChanged("");
  }
}
