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
        height: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}
