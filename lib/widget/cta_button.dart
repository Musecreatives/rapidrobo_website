import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final String text;
  final String subtext;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CTAButton({
    super.key,
    required this.text,
    required this.subtext,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return // CTA Button
        ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      icon: Icon(icon, color: Colors.white, size: 18),
      label: Column(
        children: [
          Text(text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtext,
              style: const TextStyle(fontSize: 12, color: Colors.white70)),
        ],
      ),
    );
  }
}
