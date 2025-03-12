import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidrobo/widget/cta_button.dart';
import 'package:rapidrobo/widget/image_caurosel.dart';
import 'dart:ui_web' as ui_web;
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class RapidRoboWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(),
              VideoSection(),
              PartnersSection(),
              SizedBox(
                height: 30,
              ),
              InfoSection(),
              RewardSection(),
              ReviewSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Define breakpoints and responsive values
      bool isMobile = constraints.maxWidth < 600;
      double logoHeight = isMobile ? 60 : 80;
      double titleFontSize = isMobile ? 24 : 30;
      double subtitleFontSize = isMobile ? 18 : 25;
      double spacing = isMobile ? 10 : 20;

      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/icons/logo_icon.png', height: logoHeight),
            SizedBox(height: spacing / 2),
            Text(
              "RAPIDROBOEA",
              style: GoogleFonts.montserrat(
                fontSize: titleFontSize,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing / 2),
            Text(
              "Passes FTMO Accounts, Get Payout And Use On Your Personal Accounts!",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Register YouTube IFrame for Flutter Web
    ui_web.platformViewRegistry.registerViewFactory(
      'youtube-iframe',
      (int viewId) {
        final html.IFrameElement iframe = html.IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src =
              'https://www.youtube.com/embed/dQw4w9WgXcQ' // Replace with actual video link
          ..style.border = 'none'
          ..allowFullscreen = true;
        return iframe;
      },
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1000;

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Video Container
              Container(
                width: isMobile ? width * 0.9 : 600,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4))
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: const AspectRatio(
                  aspectRatio: 16 / 9,
                  child: HtmlElementView(viewType: 'youtube-iframe'),
                ),
              ),
              const SizedBox(height: 30),

              // CTA Buttons (Adaptive Layout)
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Book A Call",
                    icon: Icons.phone,
                    color: Colors.blueAccent,
                    onPressed: () => _launchURL("tel:+447784255751"),
                  ),
                  if (!isMobile)
                    const SizedBox(width: 20)
                  else
                    const SizedBox(height: 20),
                  CustomButton(
                    textColor: Colors.black,
                    text: "Free Telegram",
                    icon: Icons.telegram,
                    color: Colors.white,
                    onPressed: () => _launchURL("https://t.me/rapidrobo"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch $url");
    }
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final Color textColor;

  const CustomButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
    this.textColor = Colors.white, // Default text color is white
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor),
      label: Text(text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 5,
      ),
    );
  }
}

class PartnersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "We Partner With Top Prop Firms & Brokers",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                // For large screens, use the original row layout.
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/icons/icon_1.png', height: 50),
                        Image.asset('assets/icons/icon_2.png', height: 50),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/icons/icon_3.png', height: 50),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/icons/icon_4.png', height: 50),
                        Image.asset('assets/icons/icon_5.png', height: 50),
                      ],
                    ),
                  ],
                );
              } else {
                // For smaller screens, use a wrap layout.
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Image.asset('assets/icons/icon_1.png', height: 50),
                    Image.asset('assets/icons/icon_2.png', height: 50),
                    Image.asset('assets/icons/icon_3.png', height: 50),
                    Image.asset('assets/icons/icon_4.png', height: 50),
                    Image.asset('assets/icons/icon_5.png', height: 50),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

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
                _buildTextContent(), // Show only text on mobile
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
      ],
    );
  }
}

class RewardSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          Column(
            children: [
              const ImageCarousel(imageList: [
                "assets/images/ftmo_reward_1.jpg",
                "assets/images/ftmo_reward_2.jpg",
                "assets/images/ftmo_reward_3.jpg",
                "assets/images/ftmo_reward_4.jpg",
                "assets/images/ftmo_reward_5.jpg",
                "assets/images/ftmo_reward_6.jpg",
                "assets/images/ftmo_reward_7.jpg",
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            "What Our Customers Say",
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Responsive Grid with Dividers
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 800
                  ? 2
                  : 1; // 2 columns for large screens, 1 for small

              return Column(
                children: List.generate(
                  (testimonials.length / crossAxisCount).ceil(),
                  (rowIndex) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            crossAxisCount * 2 - 1,
                            (colIndex) {
                              if (colIndex % 2 == 0) {
                                int index =
                                    rowIndex * crossAxisCount + (colIndex ~/ 2);
                                if (index >= testimonials.length)
                                  return Expanded(child: SizedBox());
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: TestimonialText(
                                        testimonial: testimonials[index]),
                                  ),
                                );
                              } else {
                                // Vertical Divider
                                return Container(
                                  width: 1,
                                  height: 160, // Adjust height to match text
                                  color: Colors.white24,
                                );
                              }
                            },
                          ),
                        ),
                        if (rowIndex <
                            (testimonials.length / crossAxisCount).ceil() - 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(
                                color: Colors.white24,
                                thickness: 1), // Horizontal Divider
                          ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Testimonial Model
class Testimonial {
  final String name;
  final String feedback;
  final int rating;

  Testimonial(
      {required this.name, required this.feedback, required this.rating});
}

// Testimonial Data
List<Testimonial> testimonials = [
  Testimonial(
    name: "Abdullah G.",
    feedback:
        "'RapidRobo 3.0 is the real deal! I work full-time and couldn’t afford to sit and trade all day. This bot handled everything and passed my challenge while I focused on other things. If you want a reliable, stress-free way to get funded, this is it!'",
    rating: 5,
  ),
  Testimonial(
    name: "Keith",
    feedback:
        '"I was stuck in a cycle of failing prop firm challenges until I found RapidRobo 3.0. It passed both phases of my E8 challenge smoothly. The automation and risk management are top-notch, and customer support was always there to guide me. This is a game-changer!"',
    rating: 5,
  ),
  Testimonial(
    name: "Samuel",
    feedback:
        "'I was skeptical at first, but RapidRobo 3.0 proved me wrong! It passed my FTMO challenge in record time, and now I’m trading on a funded account stress-free. The risk management is solid, and it adapts well to market conditions. Highly recommend to anyone serious about getting funded!'",
    rating: 5,
  ),
  Testimonial(
    name: "Eoin",
    feedback:
        '"I was stuck in a cycle of failing prop firm challenges until I found RapidRobo 3.0. It passed both phases of my E8 challenge smoothly. The automation and risk management are top-notch, and customer support was always there to guide me. This is a game-changer!"',
    rating: 5,
  ),
];

// Testimonial Text Widget (No Container)
class TestimonialText extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialText({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ${testimonial.name}",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          testimonial.feedback,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            testimonial.rating,
            (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
          ),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: Colors.black, // Background color
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          Image.asset(
            "assets/logo.png",
            height: 50, // Adjust logo size
          ),
          const SizedBox(height: 10),

          // Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink("Terms & Conditions", () {
                // Navigate or show terms
              }),
              const SizedBox(width: 15),
              _buildFooterLink("Privacy Policy", () {
                // Navigate or show policy
              }),
            ],
          ),

          const SizedBox(height: 10),

          // Copyright text
          const Text(
            "© 2024 Rapidrobo Trading. All rights reserved.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white, size: 18),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      label: Column(
        children: [
          Text(text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 4),
          Text(text,
              style: const TextStyle(fontSize: 12, color: Colors.white70)),
        ],
      ),
    );
  }
}
