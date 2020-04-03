import 'dart:convert';
import 'package:emotional_text_to_speech/Models/Sentence.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import '../Constants.dart';
import 'Interceptor.dart';

class SentenceRepo {
  Client client = HttpClientWithInterceptor.build(interceptors: [
    Interceptor(),
  ]);

  Future<bool> sendSentences(List<Sentence> sentences) async {
    var response = await client.post(
      '${Constants.baseUrl}',
      body: jsonEncode(sentences),
    );

    return json.decode(response.body)['success'] ?? false;
  }
}
