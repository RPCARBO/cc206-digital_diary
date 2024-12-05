import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<String> fetchApiKey() async {
  final response = await http.get(
    Uri.parse('https://secretmanager.googleapis.com/v1/projects/592701245398/secrets/googleapikey/versions/latest:access'),
    headers: {
      'Authorization': 'Bearer ya29.c.c0ASRK0GaO9s0fJFnH-FOwN05FNkkyGDkhwUsL-QZq-xNzw3KpYgYbtikhweui5l7vK3yIxtCTjoyAe97nTifhqu4XTLyQ2kW1QLMY8biwCj-70WhxrHughjBDTzH4ezot3MzKxsaD8FmANlYJ5e6Q9rCpe3I-weTpXTwjqNve9L_k950zKZzUikygXWtSNw0jOSvha721v58-IqWtqc7OyRq1D_RO1G1h6h8Dhv7ucvQhWKUnzxrtjoygXWJYCbULh9d_mBtX_vRNcDkKKzmjWY2-8cgTPLLhPq9-YC9wEPseu7m8FJJuRX8qbmD4vkeNLKFgql_TydTKseg-CAyMyKCoEN1OgAMZLiIfSJnqQLVcRSCehwjNIPRgG385DfIwp0izo01BqZXxuupQSXm7p0Mb_WJxfrOe4vg55RajcJrJ95zrIhY00qdMUwrqQIhkWuJUoVmnmQFl2diFXJvc66BsJc1lcnS0mWo0lFk9uU47FkI8Uud0J53afUbxy91Bi4Sa1wJr2yY6QS2Orc0wpb95yySxrQXgubzol973sg5Wfhex0tk4YrXQyRoW_gz321gdeehWfwya6SQMXay1bf_9z6BZVpi4VugYYzUcZ4I7vJrYyu6BMsU9q5IRirwRtIkIo_WhvXgpftJ6brIBx5b2w1fkMy8tfaSZsj81vv5r_2wf08U6yX8Ve3z-Vzn2w6pzk69qtoo5JkoYY65Qdy3bflovY84qwwM-Xi810h9fnUzhJSccYIkm9-Y3whwjlm4RJSvVsfZc4qhvwpkflZYmIcfi5MexOlsMXajtBib9oi2d6wnBeq2bikwe0m03mB1_O9ByugX53WfWcUVYbvVnvOBe0Y72Ws4dfZ4SrzecXva1uhJYaYUxz5nxBuIzmwVO421_v7z0duyex_df5vd1j2vY1Rnc8zytXhhlfza4e-OXVwz1uZWinJJwyXBQWse9q3l4_98RWk8hbj55VX2nv5lrY_8sWtzoFwO5O8Bvv968mSR-UxB',
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
