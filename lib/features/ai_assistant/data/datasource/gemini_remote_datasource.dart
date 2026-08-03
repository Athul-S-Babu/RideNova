import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiRemoteDataSource {
  GeminiRemoteDataSource({
    required this.apiKey,
  });

  final String apiKey;

  Future<Map<String, dynamic>>
  extractBookingDetails(
      String message,
      ) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );

    final prompt = """
Extract the ride booking details from the user's message.

Return ONLY valid JSON.

{
  "pickup":"",
  "destination":"",
  "date":"",
  "time":"",
  "vehicle":""
}

User Message:
$message
""";

    final response = await model.generateContent([
      Content.text(prompt),
    ]);

    final text = response.text;

    if (text == null || text.isEmpty) {
      throw Exception("Empty response from Gemini");
    }

    return jsonDecode(text);
  }
}