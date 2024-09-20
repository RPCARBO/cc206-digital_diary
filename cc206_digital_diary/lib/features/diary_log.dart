import 'package:flutter/material.dart';

class DiaryLog extends StatefulWidget {  // Rename MyApp to DiaryLog
  const DiaryLog({super.key});

  @override
  _DiaryLogState createState() => _DiaryLogState();  // Rename _MyAppState to _DiaryLogState
}

class _DiaryLogState extends State<DiaryLog> {  // Rename _MyAppState to _DiaryLogState
  final TextEditingController _controller = TextEditingController();
  String _userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // No need for MaterialApp here, just the Scaffold
      appBar: AppBar(
        title: const Text('Digital Diary'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextField to take user input
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter your diary entry here',
              ),
            ),
          ),

          // Button to submit input
          ElevatedButton(
            onPressed: () {
              setState(() {
                _userInput = _controller.text;  // Update _userInput with the text entered by the user
                _controller.clear();  // Clear the TextField after submission
              });
            },
            child: const Text('Submit'),
          ),

          // Display the user's input
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _userInput.isNotEmpty ? 'Your Entry: $_userInput' : 'No entry yet.',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const DiaryLog());  // Update this to use DiaryLog
}
