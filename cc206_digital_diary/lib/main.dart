import 'package:flutter/material.dart';
import 'features/diary_log.dart';  // Import the DiaryLog widget
import 'features/homepage.dart';  // Import the new HomePage widget

void main() {  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {  
  const MyApp({super.key});

  @override  
  Widget build(BuildContext context) {    
    return MaterialApp(      
      title: 'Digital Diary',      
      home: HomePage(),      
      routes: {        
        '/diaryLog': (context) => const DiaryLog(),      
      },    
    );  
  }
}
