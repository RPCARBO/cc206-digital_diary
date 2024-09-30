import 'package:flutter/material.dart';
import 'display_user_avatar.dart'; // Import the UserAvatar widget

class DiaryLog extends StatelessWidget {
  const DiaryLog({Key? key}) : super(key: key);

  // List of image asset paths
  static const List<String> imageUrls = [
    'assets/bday1.jpg',
    'assets/bday2.jpg',
    'assets/bday3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Added MaterialApp to wrap the Scaffold
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Digital Diary'),
          backgroundColor: Colors.blue,
        ),
        body: Column( // Main column to layout everything
          children: [
            const Spacer(), // Pushes the content below towards the center vertically
            const Row( // Added Row to horizontally display the avatar and icon
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Display the cake icon
                Icon(
                  Icons.cake,
                  size: 65.0, // Adjust the size of the icon
                ),

                SizedBox(width: 10), // Space between icon and avatar

                Row(
                  children: [
                    UserAvatar(imageUrl: 'assets/avatar.jpg'), // Replace with your actual image URL
                    SizedBox(width: 10),
                    Text(
                      "xXSigma_LordXx",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ]
                ),                            
              ],
            ),
            const SizedBox(height: 30), // Added space between Row and text
            const Center(
              child: Column( // Use Column to display multiple lines of text
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
            const Spacer(), // Pushes the content above towards the center vertically

            // New GridView widget for 1 row and 3 columns without scrolling
            GridView.count(
              crossAxisCount: 3, // 3 columns
              crossAxisSpacing: 10, // Space between columns
              mainAxisSpacing: 10, // Space between rows
              shrinkWrap: true, // Prevent scrolling, make grid fit content
              childAspectRatio: 1.5, // Adjust aspect ratio 
              children: List.generate(imageUrls.length, (index) {
                return Container(
                  padding: const EdgeInsets.all(4), // padding
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), // Reduce border width
                    borderRadius: BorderRadius.circular(8), // Add some rounding 
                  ),
                  child: ClipRRect( // Clip the image to have rounded corners
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset( 
                      imageUrls[index],
                      fit: BoxFit.cover, 
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
