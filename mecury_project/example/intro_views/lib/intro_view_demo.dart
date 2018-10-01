import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroViewDemo extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    new PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        iconImageAssetPath: 'assets/air-hostess.png',
        iconColor: null,
        bubbleBackgroundColor: null,
        body: Text(
          'Haselfree  booking  of  flight  tickets  with  full  refund  on  cancelation',
        ),
        title: Text(
          'Flights',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/airplane.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    new PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/waiter.png',
      iconColor: null,
      bubbleBackgroundColor: null,
      body: Text(
        'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
      ),
      title: Text('Hotels'),
      mainImage: Image.asset(
        'assets/hotel.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    new PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/taxi-driver.png',
      iconColor: null,
      bubbleBackgroundColor: null,
      body: Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: Text('Cabs'),
      mainImage: Image.asset(
        'assets/taxi.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: new Builder(
        builder: (context) => new IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new MyHomePage(title: 'Flutter Demo Home Page'),
              ), //MaterialPageRoute
            );
          },
          showSkipButton:
          true, //Whether you want to show the skip button or not.
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}