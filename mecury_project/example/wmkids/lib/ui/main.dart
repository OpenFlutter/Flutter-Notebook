import 'package:flutter/material.dart';
import 'package:wmkids/ui/alarms/alarms_screen.dart';
import 'package:wmkids/ui/email/email_screen.dart';
import 'package:wmkids/ui/home/home_screen.dart';
import 'package:wmkids/ui/profile/profile_screen.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {

  List<Widget> pages = List<Widget>();
  final _bottomNavigationBarItemColor = Colors.teal;
  int _bottomNavigationIndex = 0;

  @override
  void initState() {
    pages
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AlarmsScreen())
      ..add(ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationBarItemColor,
              ),
              title: Text('HOME',style: TextStyle(color: _bottomNavigationBarItemColor),)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationBarItemColor,
              ),
              title: Text('EMAIL',style: TextStyle(color: _bottomNavigationBarItemColor),)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_alarms,
                color: _bottomNavigationBarItemColor,
              ),
              title: Text('ALARMS',style: TextStyle(color: _bottomNavigationBarItemColor),)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _bottomNavigationBarItemColor,
              ),
              title: Text('AIRPLAY',style: TextStyle(color: _bottomNavigationBarItemColor),)),
        ],
        currentIndex: _bottomNavigationIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavigationIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
