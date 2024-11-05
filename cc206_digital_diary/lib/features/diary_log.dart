// ignore_for_file: unused_field

import 'dart:math'; 
import 'package:flutter/material.dart';
import 'display_user_avatar.dart'; // Import the UserAvatar widget
import 'package:confetti/confetti.dart'; // Import the Confetti package
import 'diary_entry.dart'; // Import the DiaryEntry screen

class DiaryLog extends StatefulWidget {
  const DiaryLog({super.key});

  // List of image asset paths
  static const List<String> imageUrls = [
    'assets/bday1.jpg',
    'assets/bday2.jpg',
    'assets/bday3.jpg',
  ];

  @override
  _DiaryLogState createState() => _DiaryLogState();
}

class _DiaryLogState extends State<DiaryLog> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isConfettiPlaying = false;
  late ConfettiController _confettiController;
  late ConfettiController _intenseConfettiController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final double _fontsize = 25.0;
  double _scaleFactor = 1.0; // Variable to track scale factor

  final List<Map<String, dynamic>> _entries = []; // List to store diary entries

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
    _intenseConfettiController = ConfettiController(duration: const Duration(seconds: 3));

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _intenseConfettiController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      if (details.primaryVelocity! < 0) {
        // Swiped left
        _currentIndex = (_currentIndex + 1) % DiaryLog.imageUrls.length;
      } else if (details.primaryVelocity! > 0) {
        // Swiped right
        _currentIndex = (_currentIndex - 1 + DiaryLog.imageUrls.length) % DiaryLog.imageUrls.length;
      }
    });
  }

  void _onTapConfetti() {
    setState(() {
      _isConfettiPlaying = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    _confettiController.play();
  }

  void _onLongPressConfettiStart() {
    setState(() {
      _isConfettiPlaying = true;
    });
    _animationController.repeat(reverse: true);
    _intenseConfettiController.play();
  }

  void _onLongPressConfettiEnd() {
    setState(() {
      _isConfettiPlaying = false;
    });
    _animationController.stop();
    _animationController.reset();
    _intenseConfettiController.stop();
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scaleFactor = (details.scale).clamp(0.5, 2.0); // Scale between 0.5 and 2.0
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    // Reset scale factor after gesture ends
    setState(() {
      _scaleFactor = 1.0; 
    });
  }

  void _navigateToAddEntry() async {
    final newEntry = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const DiaryEntry()),
    );

    if (newEntry != null) {
      setState(() {
        _entries.add(newEntry); // Add the new entry to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Diary'),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ElevatedButton(
              onPressed: _navigateToAddEntry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900], // Slightly darker than blue
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Add Entry',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragEnd: _onHorizontalDragEnd,
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: _onScaleEnd, // Add the scale end callback
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _onTapConfetti,
                      onLongPressStart: (_) => _onLongPressConfettiStart(),
                      onLongPressEnd: (_) => _onLongPressConfettiEnd(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: ScaleTransition(
                          scale: _animation,
                          child: const Icon(Icons.cake, size: 65.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Row(
                      children: [
                        UserAvatar(imageUrl: 'assets/avatar.jpg'), // Temporary avatar
                        SizedBox(width: 10),
                        Text(
                          "xXSigma_LordXx",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Birthday Memories',
                        style: TextStyle(fontSize: _fontsize, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Swipe left or right to view more memories',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Updated SizedBox to reflect the scaling effect
                SizedBox(
                  height: 200 * _scaleFactor, // Scale height based on the scale factor
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          DiaryLog.imageUrls[_currentIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Display diary entries
                Expanded(
                  child: ListView.builder(
                    itemCount: _entries.length,
                    itemBuilder: (context, index) {
                      final entry = _entries[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ListTile(
                            title: Text(
                            (entry['title'] ?? 'Untitled').toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          subtitle: Text(entry['body'] ?? 'No content', style: const TextStyle(fontSize: 14)
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              numberOfParticles: 5,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _intenseConfettiController,
              blastDirection: pi / 2,
              numberOfParticles: 5,
              emissionFrequency: 0.10,
              minBlastForce: 40,
              maxBlastForce: 60,
            ),
          ),
        ],
      ),
    );
  }
}
