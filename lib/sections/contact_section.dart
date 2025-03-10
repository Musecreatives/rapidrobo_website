import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                        const ContactText(),
                        const SizedBox(height: 30),
                        Image.asset(
                          "assets/images/phone_1.png",
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: ContactText(),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: Image.asset(
                            "assets/images/phone_1.png",
                            fit: BoxFit.contain,
                            height: 600,
                            width: 620,
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

// Extracted Contact Text for Clean Code
class ContactText extends StatelessWidget {
  const ContactText({super.key});

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
          "Get in touch with our team for expert support and\npersonalized guidance, "
          "or join our free channel to explore\nreal-time results, success stories, and insights from our community!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () {
            // Action for messaging
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
          icon: const Icon(FontAwesomeIcons.telegram,
              color: Colors.white, size: 18),
          label: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Message Our Team Now",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                "Our Team Of Experts Reply Within Minutes",
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
