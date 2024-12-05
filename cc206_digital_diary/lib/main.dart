import 'package:cc206_digital_diary/features/homepage.dart';
import 'package:flutter/material.dart'; 
import 'features/diary_entry.dart'; // Import DiaryEntry
import 'features/diary_log.dart'; // Import DiaryLog

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Diary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(), // Home screen
        '/add_entry': (context) => const DiaryEntry(), // Declare Entry screen
        '/DiaryLog': (context) => const DiaryLog(), // Declare Diary Log screen
      },
    );
  }
}
