/**
 * launch函数接收3个参数，email，subject，body,各个参数代表含义各位应该都能猜到。
 * 传入email格式为mailto:xxx@xxx.xx?subject=xxxxx&body=xxxxx
 */
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class EmailLauncherDemo extends StatefulWidget {
  @override
  _EmailLauncherDemoState createState() => _EmailLauncherDemoState();
}

class _EmailLauncherDemoState extends State<EmailLauncherDemo> {
  Future<Null> _launched;

  Future<Null> _sendEmail(String email,String subject,String body) async {
    email = "mailto:$email?subject=$subject&body=$body";
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not send $email';
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
    const String email = '1652219550a@gmail.com';
    const String subject = 'email test';
    const String body = '这是一次email测试';
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("email launcher demo"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () => setState(() {
                    _launched = _sendEmail(email,subject,body);
                  }),
              child: const Text('Send a email'),
            ),
            const Padding(padding: const EdgeInsets.all(16.0)),
            new FutureBuilder<Null>(future: _launched, builder: _launchStatus),
          ],
        ),
      ),
    );
  }
}
