import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double height;

  const SectionWidget(this.title, this.color, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Height for each section
      width: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
} 