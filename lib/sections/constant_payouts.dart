import 'package:flutter/material.dart';
import 'package:rapidrobo/widget/cta_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ConstantPayouts extends StatelessWidget {
  const ConstantPayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800; // Define a breakpoint

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 80, vertical: 40),
          child: Column(
            children: [
              isMobile
                  ? Column(
                      children: [
                        Image.asset(
                          "assets/images/phone_2.png",
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                        const SizedBox(height: 30),
                        const ConstantPayoutsText(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/images/phone_2.png",
                            fit: BoxFit.contain,
                            height: 600,
                            width: 620,
                          ),
                        ),
                        const SizedBox(width: 50),
                        const Expanded(
                          flex: 1,
                          child: ConstantPayoutsText(),
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

// Extracted Text Section for Better Readability
class ConstantPayoutsText extends StatelessWidget {
  const ConstantPayoutsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get In Touch With Our Team Or Join Our\nFree Channel To Check Out Our Results",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "Get in touch with our team for expert support and\n"
          "personalized guidance, or join our free channel to explore\n"
          "real-time results, success stories, and insights from our community!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 30),
        CTAButton(
          text: "Message Our Team Now",
          subtext: "Our Team Of Experts Replies Within Minutes",
          icon: Icons.send,
          color: Colors.blueAccent,
          onPressed: () async {
            print("CTA button pressed");
            final Uri telegramUrl = Uri.parse("https://t.me/rapidrobosupport");
            if (await canLaunchUrl(telegramUrl)) {
              await launchUrl(
                telegramUrl,
                mode: LaunchMode.platformDefault,
                webOnlyWindowName:
                    '_blank', // Ensures it opens in a new tab on web
              );
            } else {
              print("Could not launch $telegramUrl");
            }
          },
        ),
      ],
    );
  }
}
