import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PassChallengeSection extends StatelessWidget {
  const PassChallengeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width > 1000 ? 80 : 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ Hero Section
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    // Title
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Pass the Challenge or Pay Nothing - ",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "It's That Simple",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Description
                    const Text(
                      "With over 250+ successfully funded clients, our team of prop firm experts specializes in helping traders navigate challenges and secure funding with confidence.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // CTA Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Action for messaging
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 24),
                      ),
                      icon: const Icon(FontAwesomeIcons.telegram,
                          color: Colors.white, size: 18),
                      label: const Column(
                        children: [
                          Text("Message Our Team Now",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 4),
                          Text("Our Team Of Experts Reply Within Minutes",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white70)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Subtitle under button
                    const Text(
                      "Our Team of Experts Replies Within Minutes",
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // ✅ Feature Cards
              const Wrap(
                alignment: WrapAlignment.center,
                spacing: 40,
                runSpacing: 20,
                children: [
                  FeatureCard(
                    icon: Icons.check_circle_outline,
                    title: "Challenge Passing",
                    description:
                        "We provide proven strategies and automation to help you pass prop firm challenges quickly and efficiently.",
                  ),
                  FeatureCard(
                    icon: Icons.trending_up,
                    title: "Equity Recovery",
                    description:
                        "Recover lost equity with smart risk management and strategic recovery solutions and trading.",
                  ),
                  FeatureCard(
                    icon: Icons.account_balance_wallet,
                    title: "Account Management",
                    description:
                        "Expert account management to maximize profits and maintain consistency done through a hands-off account manager.",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ✅ Feature Card Widget
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: Colors.blueAccent),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
