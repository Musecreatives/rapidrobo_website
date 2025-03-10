import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: Colors.black, // Background color
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          Image.asset(
            "assets/logo.png",
            height: 50, // Adjust logo size
          ),
          const SizedBox(height: 10),

          // Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink("Terms & Conditions", () {
                // Navigate or show terms
              }),
              const SizedBox(width: 15),
              _buildFooterLink("Privacy Policy", () {
                // Navigate or show policy
              }),
            ],
          ),

          const SizedBox(height: 10),

          // Copyright text
          const Text(
            "© 2024 Rapidrobo Trading. All rights reserved.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
