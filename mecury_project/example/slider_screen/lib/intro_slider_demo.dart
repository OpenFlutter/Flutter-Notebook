import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'home_screen.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => new _SliderScreenState();
}

// Custom config
//class _MyAppState extends State<MyApp> {
//  List<Slide> slides = new List();
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//          title: "SCHOOL",
//          styleTitle: TextStyle(
//              color: Color(0xffD02090),
//              fontSize: 30.0,
//              fontWeight: FontWeight.bold,
//              fontFamily: 'RobotoMono'),
//          description:
//          "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//          styleDescription: TextStyle(
//              color: Color(0xffD02090),
//              fontSize: 20.0,
//              fontStyle: FontStyle.italic,
//              fontFamily: 'Raleway'),
//          pathImage: "images/photo_school.png",
//          colorBegin: 0xffFFDAB9,
//          colorEnd: 0xff40E0D0,
//          directionColorBegin: Alignment.topLeft,
//          directionColorEnd: Alignment.bottomRight),
//    );
//    slides.add(
//      new Slide(
//        title: "MUSEUM",
//        styleTitle: TextStyle(
//            color: Color(0xffD02090),
//            fontSize: 30.0,
//            fontWeight: FontWeight.bold,
//            fontFamily: 'RobotoMono'),
//        description:
//        "Ye indulgence unreserved connection alteration appearance",
//        styleDescription: TextStyle(
//            color: Color(0xffD02090),
//            fontSize: 20.0,
//            fontStyle: FontStyle.italic,
//            fontFamily: 'Raleway'),
//        pathImage: "images/photo_museum.png",
//        colorBegin: 0xffFFFACD,
//        colorEnd: 0xffFF6347,
//        directionColorBegin: Alignment.topRight,
//        directionColorEnd: Alignment.bottomLeft,
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "COFFEE",
//        styleTitle: TextStyle(
//            color: Color(0xffD02090),
//            fontSize: 30.0,
//            fontWeight: FontWeight.bold,
//            fontFamily: 'RobotoMono'),
//        description:
//        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//        styleDescription: TextStyle(
//            color: Color(0xffD02090),
//            fontSize: 20.0,
//            fontStyle: FontStyle.italic,
//            fontFamily: 'Raleway'),
//        pathImage: "images/photo_coffee_shop.png",
//        colorBegin: 0xffFFA500,
//        colorEnd: 0xff7FFFD4,
//        directionColorBegin: Alignment.topCenter,
//        directionColorEnd: Alignment.bottomCenter,
//      ),
//    );
//  }
//
//  void onDonePress() {
//    // TODO: go to next screen
//  }
//
//  void onSkipPress() {
//    // TODO: go to next screen
//  }
//
//  Widget renderNextBtn() {
//    return Icon(
//      Icons.navigate_next,
//      color: Color(0xffD02090),
//      size: 35.0,
//    );
//  }
//
//  Widget renderDoneBtn() {
//    return Icon(
//      Icons.done,
//      color: Color(0xffD02090),
//    );
//  }
//
//  Widget renderSkipBtn() {
//    return Icon(
//      Icons.skip_next,
//      color: Color(0xffD02090),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new IntroSlider(
//      // List slides
//      slides: this.slides,
//
//      // Skip button
//      renderSkipBtn: this.renderSkipBtn(),
//      onSkipPress: this.onSkipPress,
//      colorSkipBtn: 0x33000000,
//      highlightColorSkipBtn: 0xff000000,
//
//      // Next, Done button
//      onDonePress: this.onDonePress,
//      renderNextBtn: this.renderNextBtn(),
//      renderDoneBtn: this.renderDoneBtn(),
//      colorDoneBtn: 0x33000000,
//      highlightColorDoneBtn: 0xff000000,
//
//      // Dot indicator
//      colorDot: 0x33D02090,
//      colorActiveDot: 0xffD02090,
//      sizeDot: 13.0,
//    );
//  }
//}

class _SliderScreenState extends State<SliderScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "FLUTTER",
        description:
            "Get Faster Development, Flexible UI & Access Native Features. Learn More! High-Quality Interfaces. Flexible UI. Fast Development.",
        pathImage: "assets/images/flutter.png",
        backgroundColor: 0xfff5a623,
      ),
    );
    slides.add(
      new Slide(
        title: "DART",
        description:
            "Developers at Google and elsewhere use Dart to create high-quality, mission-critical apps for iOS, Android, and the web. With features aimed at client-side development, Dart is a great fit for both mobile and web apps.",
        pathImage: "assets/images/dart.png",
        backgroundColor: 0xff203152,
      ),
    );
    slides.add(
      new Slide(
        title: "WELECOME",
        description:
            "开始你的app",
        pathImage: "assets/images/flutterlogo.png",
        backgroundColor: 0xff9932CC,
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: "home page",
                )),
        (route) => route == null);
  }

  void onSkipPress() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: "home page",
                )),
        (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
