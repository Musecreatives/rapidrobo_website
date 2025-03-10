import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
