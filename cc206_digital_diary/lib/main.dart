import 'package:flutter/material.dart';
import 'features/diary_log.dart';  // Import the DiaryLog widget
<<<<<<< Updated upstream
import 'features/display_user_avatar.dart';
import 'features/homepage.dart';  // Import the new HomePage widget

void main() {  
  runApp(MyApp());
=======
import 'features/homepage.dart';  // Import the new HomePage widget

void main() {  
  runApp(const MyApp());
>>>>>>> Stashed changes
}

class MyApp extends StatelessWidget {  
  const MyApp({super.key});

  @override  
  Widget build(BuildContext context) {    
    return MaterialApp(      
      title: 'Digital Diary',      
      home: HomePage(),      
      routes: {        
<<<<<<< Updated upstream
        '/diaryLog': (context) => DiaryLog(),      
=======
        '/diaryLog': (context) => const DiaryLog(),      
>>>>>>> Stashed changes
      },    
    );  
  }
}
