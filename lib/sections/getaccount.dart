import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/cta_button.dart';

class GetAccountSection extends StatelessWidget {
  const GetAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800; // Define breakpoint

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 120, vertical: 40),
          child: Column(
            children: [
              isMobile
                  ? Column(
                      children: [
                        const GetAccountText(),
                        const SizedBox(height: 30),
                        Image.asset(
                          "assets/images/banner_2.png",
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: GetAccountText(),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: Image.asset(
                            "assets/images/banner_2.png",
                            fit: BoxFit.contain,
                            height: 500,
                            width: 500,
                          ),
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

// Extracted Text Section for Clean Code
class GetAccountText extends StatelessWidget {
  const GetAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get Your Account Fully Passed &\nManaged By A Team Of Expert Traders",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          "Let our team of expert traders handle everything for you.\n"
          "We’ll pass your account and manage it with precision,\n"
          "ensuring consistent growth and success - completely hands-\nfree!",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        CTAButton(
          text: "Buy RapidRobo",
          subtext: "Get RapidRobo Now",
          icon: Icons.send,
          color: Colors.deepPurple,
          onPressed: () async {
            // Replace with your Telegram channel/profile link
            final telegramLink = Uri.parse('https://t.me/rapidrobosupport');

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
      ],
    );
  }
}
