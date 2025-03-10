// Custom widget for hero images
import 'package:flutter/material.dart';

class HeroImageCard extends StatelessWidget {
  final String imagePath;
  const HeroImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: 80,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }
}
