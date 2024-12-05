import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future<String> fetchApiKey() async {
  final response = await http.get(
    Uri.parse('https://secretmanager.googleapis.com/v1/projects/592701245398/secrets/googleapikey/versions/latest:access'),
    headers: {
      'Authorization': 'Bearer ${dotenv.env['BEARER_TOKEN']}',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return utf8.decode(base64.decode(jsonResponse['payload']['data']));
  } else {
    throw Exception('Failed to load API key');
  }
}

Future initFirebase() async {
  String apiKey = await fetchApiKey();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: apiKey,
            authDomain: "flutter-diary-9d25d.firebaseapp.com",
            projectId: "flutter-diary-9d25d",
            storageBucket: "flutter-diary-9d25d.firebasestorage.app",
            messagingSenderId: "592701245398",
            appId: "1:592701245398:web:2bef624001c5dfc3148677",
            measurementId: "G-66MQCR30PJ"));
  } else {
    await Firebase.initializeApp();
  }
}
