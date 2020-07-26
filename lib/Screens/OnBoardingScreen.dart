import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import 'HomePage.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  static final double fontSize = 32;

  @override
  void initState() {
    super.initState();
    updateUserVisits();
  }

  final page1 = new PageViewModel(
    pageColor: const Color(0xFF607D8B),
    iconImageAssetPath: 'assets/images/pencil.png',
    body: Text(
      'Simply enter the desired text that you want to produce with emotion.',
    ),
    title: Text('Enter Your Text'),
    mainImage: Image.asset(
      'assets/images/pencil.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(fontFamily: 'Great_Vibes', color: Colors.white),
    bodyTextStyle: TextStyle(
        fontFamily: 'Great_Vibes', color: Colors.white, fontSize: fontSize),
  );

  final page2 = new PageViewModel(
    pageColor: Colors.lightBlue,
    iconImageAssetPath: 'assets/images/emotion.png',
    body: Text(
      'Select the desired emotion that you want your text to be with',
    ),
    title: Text('Select Emotion'),
    mainImage: Image.asset(
      'assets/images/emotion.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(fontFamily: 'Great_Vibes', color: Colors.white),
    bodyTextStyle: TextStyle(
        fontFamily: 'Great_Vibes', color: Colors.white, fontSize: fontSize),
  );

  final page3 = new PageViewModel(
    pageColor: const Color(0xFFFFCD9F),
//    iconImageAssetPath: 'assets/images/headphone.png',
    bubble: Container(
        color: Color(0xFFFFCD9F),
        child: Image.asset('assets/images/headphone.png', fit: BoxFit.cover,)),
    body: Text(
      'Select the desired emotion that you want your text to be with',
    ),
    // 😉
    title: Text('Listen to your text '),
    mainImage: Image.asset(
      'assets/images/headphone.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(fontFamily: 'Great_Vibes', color: Colors.white),
    bodyTextStyle: TextStyle(
        fontFamily: 'Great_Vibes', color: Colors.white, fontSize: fontSize),
  );

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      [page1, page2, page3],
      onTapDoneButton: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      showSkipButton: true,
      pageButtonTextStyles: new TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontFamily: "Regular",
      ),
    );
  }

  void updateUserVisits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Constants.FirstTimeKey, false);
  }
}
