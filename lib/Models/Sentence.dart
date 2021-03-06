import '../main.dart';

class Sentence {
  String phrase;
  Emotions emotion;

  Sentence({this.phrase, this.emotion});

  Map<String, dynamic> toJson() {
    String emotionSt;
    switch (emotion) {
      case Emotions.Happy:
        emotionSt = "Happy";
        break;
      case Emotions.Sad:
        emotionSt = "Sad";
        break;
      case Emotions.Angry:
        emotionSt = "Angry";
        break;
      case Emotions.Disgust:
        emotionSt = "Disgust";
        break;
      case Emotions.Fear:
        emotionSt = "Fear";
        break;
      default:
        emotionSt = "Happy";
    }
    return {
      'phrase': phrase,
      'emotion': emotionSt,
    };
  }
}
