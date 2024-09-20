import 'package:flutter/material.dart';

class DiaryLog extends StatelessWidget {
  const DiaryLog({Key? key}) : super(key: key); 

  final String diaryEntry = "Today is my birthday, happy birthday to me!";
  static const Icon icon = Icon(
    Icons.cake,
    size: 90.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Diary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon, // Display the icon widget
            const SizedBox(height: 30), 
            Text(
              diaryEntry,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'images/birthday.png', 
              width: 200, // Increase width
              height: 200, // Increase height
            ), // Place image below the text
          ],
        ),
      ),
    );
  }
}
