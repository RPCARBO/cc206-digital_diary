import 'package:flutter/material.dart';
import 'features/diary_log.dart';  // Import the DiaryLog widget
import 'features/display_user_avatar.dart';
import 'features/homepage.dart';  // Import the new HomePage widget

void main() {  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  
  const MyApp({super.key});

  @override  
  Widget build(BuildContext context) {    
    return MaterialApp(      
      title: 'Digital Diary',      
      home: HomePage(),      
      routes: {        
        '/diaryLog': (context) => DiaryLog(),      
      },    
    );  
  }
}
