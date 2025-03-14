import 'package:flutter/material.dart';
import 'package:rapidrobo/widget/cta_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            text: "Pass your Challenge or Pay Nothing - ",
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
                    CTAButton(
                      text: "Message Our Team Now",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.send,
                      color: Colors.blue,
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobosupport');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    const SizedBox(height: 5),
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
