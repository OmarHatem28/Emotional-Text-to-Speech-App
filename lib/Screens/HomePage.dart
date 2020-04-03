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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emotional TTS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: hp(8, context)),
              Image.asset('assets/images/fcai.jfif', scale: 1.5),
              SizedBox(height: hp(6, context)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(12, context)),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Enter your text"),
                ),
              ),
              SizedBox(height: hp(6, context)),
              DropdownButton<Emotions>(
                value: selected,
                items: [
                  DropdownMenuItem(
                    child: Text("Happy"),
                    value: Emotions.Happy,
                  ),
                  DropdownMenuItem(
                    child: Text("Sad"),
                    value: Emotions.Sad,
                  ),
                  DropdownMenuItem(
                    child: Text("Angry"),
                    value: Emotions.Angry,
                  ),
                ],
                onChanged: (selected) {
                  setState(() {
                    this.selected = selected;
                  });
                },
              ),
              SizedBox(height: hp(6, context)),
              InkWell(
                onTap: () {
                  SentenceRepo sentenceRepo = new SentenceRepo();
                  sentenceRepo.sendSentences([
                    Sentence(phrase: "I will kill you", emotion: Emotions.Angry),
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
    );
  }
}
