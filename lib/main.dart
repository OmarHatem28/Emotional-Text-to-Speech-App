import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';
import 'Screens/HomePage.dart';
import 'Screens/OnBoardingScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(isFirstTime: prefs.getBool(Constants.FirstTimeKey) ?? true));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({Key key, @required this.isFirstTime}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotional TTS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isFirstTime? OnBoardingScreen() : HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

double hp(double percentage, BuildContext context) =>
    MediaQuery.of(context).size.height * percentage / 100;

double wp(double percentage, BuildContext context) =>
    MediaQuery.of(context).size.width * percentage / 100;

enum Emotions { Happy, Sad, Angry, Disgust, Fear }
