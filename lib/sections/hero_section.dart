import 'package:flutter/material.dart';
import '../widget/cta_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/herobanner.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1000;

        // Define left (text) content as a widget for reuse
        Widget leftContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Text
            Text.rich(
              TextSpan(
                text: "Pass Your Challenge or Pay Nothing -\n",
                style: TextStyle(
                  fontSize: isMobile
                      ? 26
                      : isTablet
                          ? 34
                          : 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                children: const [
                  TextSpan(
                    text: "It’s that simple!",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Text(
              "Rapidrobo Pass: Simplifying Prop Firm Funding for You!\n"
              "✅ Prop firm passing and funding\n"
              "✅ Prop firm live account management\n"
              "✅ Prop firm experts with over 250+ funded clients",
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),

            // Call to Action Button
            CTAButton(
              text: 'Check Our Results - Channel',
              subtext: 'Our Team Of Experts Replies Within Minutes',
              icon: Icons.telegram,
              color: Colors.blue,
              onPressed: () async {
                // Replace with your Telegram channel/profile link
                final telegramLink = Uri.parse('https://t.me/rapidrobo');

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

            const SizedBox(height: 30),

            // Hero Image Icons - Responsive Wrap
            Wrap(
              alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
              spacing: 12,
              runSpacing: 12,
              children: const [
                HeroImageCard(imagePath: 'assets/icons/icon_1.png'),
                HeroImageCard(imagePath: 'assets/icons/icon_2.png'),
                HeroImageCard(imagePath: 'assets/icons/icon_3.png'),
                HeroImageCard(imagePath: 'assets/icons/icon_4.png'),
                HeroImageCard(imagePath: 'assets/icons/icon_5.png'),
              ],
            ),
          ],
        );

        // For mobile, only show left content; otherwise, show a row with text and image.
        if (isMobile) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 20
                  : isTablet
                      ? 40
                      : 80,
              vertical: isMobile ? 20 : 40,
            ),
            child: leftContent,
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 20
                  : isTablet
                      ? 40
                      : 80,
              vertical: isMobile ? 20 : 40,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: leftContent,
                ),
                // Add spacing for tablet/desktop
                const SizedBox(width: 200),
                Flexible(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: isTablet ? 400 : 500,
                    ),
                    child: Image.asset(
                      'assets/images/home_banner.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
