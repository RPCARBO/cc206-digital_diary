import 'package:flutter/material.dart';
import 'display_user_avatar.dart'; // Import the UserAvatar widget

class DiaryLog extends StatelessWidget {
  DiaryLog({Key? key}) : super(key: key); 

  final String diaryEntry = "Today is my birthday, happy birthday to me!"; // Pre-made text fro the app
    final Icon icon = Icon(
      Icons.cake,
      size: 90.0, // Set your size of icon(birthday cake) here
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
            // Add UserAvatar at the top with default radius
            UserAvatar(
              imageUrl: 'https://example.com/avatar.png', // Replace with a real URL
            ),
            icon, // Display the icon
            const SizedBox(height: 30), 
            Text(
              diaryEntry, // Display the pre-made text in the website
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}