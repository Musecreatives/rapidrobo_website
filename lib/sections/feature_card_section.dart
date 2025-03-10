import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeatureCardsSection extends StatelessWidget {
  const FeatureCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Feature Card 1: Challenge Passing
          _buildFeatureCard(
            icon: FontAwesomeIcons.solidLightbulb,
            title: "Challenge Passing",
            description:
                "We provide proven strategies and\nautomation to help you pass prop firm\nchallenges quickly and efficiently.",
          ),
          const SizedBox(width: 12), // Spacing between cards

          // Feature Card 2: Equity Recovery
          _buildFeatureCard(
            icon: FontAwesomeIcons.chartLine,
            title: "Equity Recovery",
            description:
                "Recover lost equity with smart risk\nmanagement and strategic recovery\nsolutions and trading",
          ),
          const SizedBox(width: 12), // Spacing between cards

          // Feature Card 3: Account Management
          _buildFeatureCard(
            icon: FontAwesomeIcons.userTie,
            title: "Account Management",
            description:
                "Expert account management to\nmaximize profits and maintain consistency\nthrough hands-off management.",
          ),
        ],
      ),
    );
  }

  // Reusable Feature Card
  Widget _buildFeatureCard(
      {required IconData icon,
      required String title,
      required String description}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
