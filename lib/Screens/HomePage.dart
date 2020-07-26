import 'package:carousel_slider/carousel_slider.dart';
import 'package:emotional_text_to_speech/Models/Sentence.dart';
import 'package:emotional_text_to_speech/Repository/SentenceRepo.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Emotions selected = Emotions.Happy;

  List<String> images = [
    'assets/images/photo1.webp',
    'assets/images/emotion.png',
    'assets/images/joy.jpg',
    'assets/images/anger.jpg',
    'assets/images/disgust.jpg',
    'assets/images/fear.jpg',
    'assets/images/sad.jpg',
  ];

  Map<String, Emotions> emotions = {
    'assets/images/joy.jpg': Emotions.Happy,
    'assets/images/anger.jpg': Emotions.Angry,
    'assets/images/disgust.jpg': Emotions.Disgust,
    'assets/images/fear.jpg': Emotions.Fear,
    'assets/images/sad.jpg': Emotions.Sad,
  };

  double borderRadius = 15;

  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/images/fcai.png'),
        ),
        title: Text("Emotional TTS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Column(
              children: <Widget>[
                buildSlider(),
                SizedBox(height: hp(6, context)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: wp(2.5, context)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your text",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(borderRadius))),
                  ),
                ),
                SizedBox(height: hp(6, context)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: wp(2.5, context)),
                    child: Text(
                      "Emotions:",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 44,
                        fontFamily: 'Great_Vibes',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: hp(1, context)),
                Container(
                  height: hp(80, context),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: emotions.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      String key = emotions.keys.toList()[i];
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 800*i),
                        opacity: opacity,
                        child: GestureDetector(
                          onTap: () {
                            print(emotions[key]);
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius)),
                            child: ClipRRect(
                              child: Image.asset(key, fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    SentenceRepo sentenceRepo = new SentenceRepo();
                    sentenceRepo.sendSentences([
                      Sentence(
                          phrase: "I will kill you", emotion: Emotions.Angry),
                      Sentence(
                          phrase: "I passed the exam", emotion: Emotions.Happy),
                    ]);
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: wp(10, context), vertical: hp(2, context)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2),
                    ),
                    child: Text("Generate".toUpperCase()),
                  ),
                ),
                SizedBox(height: hp(12, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(height: hp(30, context)),
      items: images.map((image) {
        return Container(
            color: Colors.yellow, child: Image.asset(image, fit: BoxFit.fill));
      }).toList(),
    );
  }
}
