import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final title;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Could not launch url: $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildIcon(Function onPressed, {IconData icon, String title}) {
      return RaisedButton(
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).buttonColor,
          ),
        ),
        color: Theme.of(context).accentColor,
        onPressed: onPressed,
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Column(
        children: <Widget>[
          _buildIcon(() => _launchURL('tel:+86-156-0000-0000'), title: 'call'),
          _buildIcon(() => _launchURL('sms:+86-156-0000-0000'), title: 'sms'),
          _buildIcon(() => _launchURL('http://play.google.com/store/apps/details?id=com.google.android.apps.maps'), title: 'app market'),
          _buildIcon(() => _launchURL('alipayqr://platformapi/startapp?saId=10000007'), title: 'alipay'),
        ],
      ),
    );
  }
}
