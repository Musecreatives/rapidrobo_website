import 'package:flutter/material.dart';

class PickAPassageSection extends StatelessWidget {
  const PickAPassageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800; // Define mobile breakpoint

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                        const SizedBox(height: 20),
                        const TextContent(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/phone_2.png",
                          fit: BoxFit.contain,
                          height: 600,
                          width: 620,
                        ),
                        const SizedBox(width: 60),
                        const Expanded(
                          flex: 1,
                          child: TextContent(),
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

// Extracted Text Content for Cleaner Code
class TextContent extends StatelessWidget {
  const TextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pick A Package, Sign Up & Watch Your\nAccount Get Passed In 7-12 Trading Days",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30),
        Text(
          "Select the perfect package for your needs, sign up, and let our\n"
          "team take care of the rest. With our proven strategies, your\n"
          "account can be passed in just 7-12 trading days - effortless\n"
          "and stress-free!",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
