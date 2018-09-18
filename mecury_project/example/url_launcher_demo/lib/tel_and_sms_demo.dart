/**
 * lanuch函数只接收电话号码，并且传入的电话号码格式为tel:xxxxxxxxxx
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class TelAndSMSDemo extends StatefulWidget {
  @override
  _TelAndSMSDemoState createState() => _TelAndSMSDemoState();
}

class _TelAndSMSDemoState extends State<TelAndSMSDemo> {
  Future<Null> _launched;

  Future<Null> _makeAPhoneCall(String phone) async {
    phone = "tel:$phone";
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not send $phone';
    }
  }

  Future<Null> _sendAMessage(String phone) async {
    phone = "sms:$phone";
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<Null> snapshot) {
    if (snapshot.hasError) {
      return new Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String url = '12393748294';

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("tel and sms demo"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () => setState(() {
                _launched = _makeAPhoneCall(url);
              }),
              child: const Text('make a phone call'),
            ),
            const Padding(padding: const EdgeInsets.all(16.0)),
            new RaisedButton(
              onPressed: () => setState(() {
                _launched = _sendAMessage(url);
              }),
              child: const Text('send a message'),
            ),
            const Padding(padding: const EdgeInsets.all(16.0)),
            new FutureBuilder<Null>(future: _launched, builder: _launchStatus),
          ],
        ),
      ),
    );
  }
}