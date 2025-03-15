import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidrobo/widget/cta_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;

        return Container(
          padding: const EdgeInsets.all(20),
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile)
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:
                          Image.asset('assets/images/Laptop.png', height: 400),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: _buildTextContent(),
                    ),
                  ],
                )
              else
                _buildTextContent(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is RapidRobo EA?",
          style: GoogleFonts.montserrat(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Rapidrobo 3.0 scans the market in real-time, creates a signal, and executes trades with take profit and stop loss on your behalf. 99% of traders fail trying to trade manually—automated Rapidrobo trading is the way to go!",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 20),
        CTAButton(
          text: 'Buy Now',
          subtext: 'Buy RapidRoboEA now',
          icon: Icons.shopping_cart,
          color: Colors.black,
          onPressed: () async {
            // Replace with your Telegram channel/profile link
            final telegramLink = Uri.parse(
                'https://tradercentral.co/products/rapidrobo-crypto-bot');

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
