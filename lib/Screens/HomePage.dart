import 'package:animator/animator.dart';
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
  int selectedIndex;

  List<String> sliderImages = [
    'assets/images/photo1.webp',
    'assets/images/download.jpg',
    'assets/images/download2.jpg',
    'assets/images/joy_wide.jpg',
    'assets/images/anger_wide.jpg',
    'assets/images/disgust_wide.jpg',
    'assets/images/fear_wide.jpg',
    'assets/images/sad.jpg',
  ];

  Map<String, Emotions> emotions = {
    'assets/images/joy.jpg': Emotions.Happy,
    'assets/images/anger.jpg': Emotions.Angry,
    'assets/images/disgust.jpg': Emotions.Disgust,
    'assets/images/fear.jpg': Emotions.Fear,
    'assets/images/sad.jpg': Emotions.Sad,
  };

  List<Color> emotionColors = [
    Colors.yellow[700],
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.blue,
  ];

  double borderRadius = 15;

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:
            selectedIndex == null ? Colors.black : emotionColors[selectedIndex],
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
                    controller: textController,
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
                        color: selectedIndex == null
                            ? Colors.black
                            : emotionColors[selectedIndex],
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
                      return buildAnimatedCard(key, i);
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (selectedIndex == null) {
                      showWarningDialog(
                          "Note", "Please Select an emotion first.");
                      return;
                    } else if (textController.text.isEmpty) {
                      showWarningDialog(
                          "Note", "Please Enter your text first.");
                      return;
                    }
                    SentenceRepo sentenceRepo = new SentenceRepo();
                    print(emotions[emotions.keys.toList()[selectedIndex]]);
                    sentenceRepo.sendSentences([
                      Sentence(
                          phrase: textController.text,
                          emotion:
                              emotions[emotions.keys.toList()[selectedIndex]]),
//                      Sentence(
//                          phrase: "I passed the exam", emotion: Emotions.Happy),
                    ]);
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: wp(10, context), vertical: hp(2, context)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: selectedIndex == null
                            ? Colors.black
                            : emotionColors[selectedIndex]),
                    child: Text(
                      "Generate".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
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
      options: CarouselOptions(
        height: hp(30, context),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: sliderImages.map((image) {
        return Image.asset(image, fit: BoxFit.fill);
      }).toList(),
    );
  }

  void showWarningDialog(String title, String content) {
    showDialog(
        context: context,
        builder: (_context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.warning,
                  color: Colors.yellow[700],
                ),
                Text(
                  " $title",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(_context),
                child: Text("Close"),
              ),
            ],
          );
        });
  }

  Widget buildAnimatedCard(String key, int i) {
    return Animator(
      tween: Tween<Offset>(begin: Offset(-0.9, 1), end: Offset(0, 0)),
      duration: Duration(milliseconds: (i + 4) * 1200),
      curve: Curves.elasticOut,
      repeats: 1,
      resetAnimationOnRebuild: true,
      builder: (context, animatorState, child) {
        return FractionalTranslation(
          translation: animatorState.value,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = i;
              });
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset(
                      key,
                      fit: BoxFit.fill,
                      width: wp(50, context),
                      height: hp(25, context),
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  Visibility(
                    visible: selectedIndex == i,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: Icon(Icons.check_circle,
                            color: Colors.white54, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
