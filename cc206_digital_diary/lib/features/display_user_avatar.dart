import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imageUrl),
      backgroundColor: const Color.fromARGB(255, 255, 251, 0), // Placeholder color
    );
  }
}
