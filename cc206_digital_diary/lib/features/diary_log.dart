// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'display_user_avatar.dart'; // Import the UserAvatar widget
import 'package:confetti/confetti.dart'; // Import the Confetti package
import 'dart:math'; // For blastDirection

class DiaryLog extends StatefulWidget {
  const DiaryLog({super.key});

  // List of image asset paths
  static const List<String> imageUrls = [
    'assets/bday1.jpg',
    'assets/bday2.jpg',
    'assets/bday3.jpg',
  ];

  @override
  // ignore: library_private_types_in_public_api
  _DiaryLogState createState() => _DiaryLogState();
}

class _DiaryLogState extends State<DiaryLog> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isConfettiPlaying = false;
  late ConfettiController _confettiController;
  late ConfettiController _intenseConfettiController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  double _fontsize = 25.0;

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
      _fontsize = (25.0 * details.scale).clamp(15.0, 50.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Diary'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragEnd: _onHorizontalDragEnd,
            onScaleUpdate: _onScaleUpdate, // Trigger live scaling on pinch
            child: Column(
              children: [
                const Spacer(), // Pushes the content below
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
                    const SizedBox(width: 10), // Space between icon and avatar
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
                const SizedBox(height: 30), // Space adjustment between Row and text
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Happy birthday to me!",
                        style: TextStyle(fontSize: _fontsize), // Adjust font size
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Today is my birthday",
                        style: TextStyle(fontSize: _fontsize),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "I feel so happy",
                        style: TextStyle(fontSize: _fontsize),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4), // Padding for image container
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
