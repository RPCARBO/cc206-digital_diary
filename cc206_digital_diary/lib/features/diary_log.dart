// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'display_user_avatar.dart'; // Import the UserAvatar widget
import 'package:confetti/confetti.dart'; // Import the Confetti package
import 'dart:math'; // For blastDirection

<<<<<<< Updated upstream
class DiaryLog extends StatefulWidget {  
  const DiaryLog({Key? key}) : super(key: key);
=======
class DiaryLog extends StatefulWidget {
  const DiaryLog({super.key});
>>>>>>> Stashed changes

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

  @override
<<<<<<< Updated upstream
=======
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
>>>>>>> Stashed changes
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
    _intenseConfettiController = ConfettiController(duration: const Duration(seconds: 3));

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
<<<<<<< Updated upstream
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
=======
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    if (details.primaryVelocity! < 0) {
      // Swiped left
      setState(() {
        _currentIndex = (_currentIndex + 1) % DiaryLog.imageUrls.length;
      });
    } else if (details.primaryVelocity! > 0) {
      // Swiped right
      setState(() {
        _currentIndex = (_currentIndex - 1 + DiaryLog.imageUrls.length) % DiaryLog.imageUrls.length;
      });
    }
=======
    setState(() {
      if (details.primaryVelocity! < 0) {
        // Swiped left
        _currentIndex = (_currentIndex + 1) % DiaryLog.imageUrls.length;
      } else if (details.primaryVelocity! > 0) {
        // Swiped right
        _currentIndex = (_currentIndex - 1 + DiaryLog.imageUrls.length) % DiaryLog.imageUrls.length;
      }
    });
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
  @override  
  Widget build(BuildContext context) {    
    return Scaffold(      
      appBar: AppBar(        
        title: const Text('Digital Diary'),        
        backgroundColor: Colors.blue,      
      ),      
=======
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
>>>>>>> Stashed changes
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragEnd: _onHorizontalDragEnd,
<<<<<<< Updated upstream
            child: Column(          
              children: [            
                const Spacer(), // Pushes the content below       
                Row(              
                  mainAxisAlignment: MainAxisAlignment.center,              
                  children: [                
=======
            onScaleUpdate: _onScaleUpdate, // Trigger live scaling on pinch
            child: Column(
              children: [
                const Spacer(), // Pushes the content below
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
>>>>>>> Stashed changes
                    GestureDetector(
                      onTap: _onTapConfetti,
                      onLongPressStart: (_) => _onLongPressConfettiStart(),
                      onLongPressEnd: (_) => _onLongPressConfettiEnd(),
<<<<<<< Updated upstream
                      child: ScaleTransition(
                        scale: _animation,
                        child: const Icon(                  
                          Icons.cake,                  
                          size: 65.0, // Adjust the size of the icon                
                        ),
                      ),
                    ),                
                    const SizedBox(width: 10), // Space between icon and avatar                
                    Row(                  
                      children: [                    
                        const UserAvatar(imageUrl: 'assets/avatar.jpg'), // temp avatar                 
                        const SizedBox(width: 10),                    
                        const Text(                      
                          "xXSigma_LordXx",                      
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),                    
                        )                  
                      ]                
                    ),              
                  ],            
                ),            
                const SizedBox(height: 30), // Added space between Row and text/ adjust later           
                const Center(              
                  child: Column(                
                    children: [                  
                      Text(                    
                        "Happy birthday to me!", // First sentence                    
                        style: TextStyle(fontSize: 25), // Adjust font size                  
                      ),                  
                      SizedBox(height: 5), // Space between sentences                  
                      Text(                    
                        "Today is my birthday", // Second sentence                    
                        style: TextStyle(fontSize: 25),                  
                      ),                  
                      SizedBox(height: 5), // Space between sentences                  
                      Text(                    
                        "I feel so happy", // Third sentence                    
                        style: TextStyle(fontSize: 25),                  
                      ),                
                    ],              
                  ),            
                ),            
                const Spacer(),            
                Container(
                  height: 200,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4), // padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1), 
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      child: ClipRRect( // Clip the image to have rounded corners
=======
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
>>>>>>> Stashed changes
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          DiaryLog.imageUrls[_currentIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
<<<<<<< Updated upstream
              ],        
            ),
          ),
          Align(
            alignment: Alignment.topCenter, // confetti where it comes from
            child: ConfettiWidget(
              confettiController: _confettiController, // on tap
=======
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
>>>>>>> Stashed changes
              blastDirection: pi / 2,
              numberOfParticles: 5,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
<<<<<<< Updated upstream
              confettiController: _intenseConfettiController, // on long press
=======
              confettiController: _intenseConfettiController,
>>>>>>> Stashed changes
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
