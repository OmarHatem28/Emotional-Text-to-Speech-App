import 'package:flutter/material.dart';

import 'Screens/OnBoardingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotional TTS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
