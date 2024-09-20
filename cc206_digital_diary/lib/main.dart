import 'package:flutter/material.dart';
import 'features/diary_log.dart';  // Import the DiaryLog widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Digital Diary',
      home: DiaryLog(),  // Use DiaryLog as the home widget
    );
  }
}
