import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapidrobo/widget/image_caurosel.dart';
import 'package:rapidrobo/widget/testimonial_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../widget/cta_button.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 40.0 : 16.0,
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "TESTIMONIALS & RESULTS",
            style: TextStyle(
              fontSize: isTablet ? 22 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "What others are saying - Scan the barcodes to verify the FTMO certificates & Results",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isTablet ? 32 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // ✅ First Carousel - Passed FTMO Challenges
          Text(
            "Passed FTMO Challenges",
            style: TextStyle(
              fontSize: isTablet ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const ImageCarousel(imageList: [
            "assets/images/ftmopassed_1.jpg",
            "assets/images/ftmopassed_2.jpg",
            "assets/images/ftmopassed_3.jpg",
            "assets/images/ftmopassed_4.jpg",
          ]),

          const SizedBox(height: 30),

          // ✅ Second Carousel - FTMO Rewards
          Text(
            "FTMO Rewards & Withdrawals",
            style: TextStyle(
              fontSize: isTablet ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const ImageCarousel(imageList: [
            "assets/images/ftmo_reward_1.jpg",
            "assets/images/ftmo_reward_2.jpg",
            "assets/images/ftmo_reward_3.jpg",
            "assets/images/ftmo_reward_4.jpg",
            "assets/images/ftmo_reward_5.jpg",
            "assets/images/ftmo_reward_6.jpg",
            "assets/images/ftmo_reward_7.jpg",
          ]),

          const SizedBox(height: 30),

          // ✅ Testimonial Cards Layout
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700;
              return isMobile
                  ? const Column(
                      children: [
                        TestimonialCard(
                          text:
                              "RapidRobo 3.0 is the real deal! I work full-time and couldn’t afford to sit and trade all day. This bot handled everything and passed my challenge while I focused on other things. If you want a reliable,stress-free way to get funded, this is it!",
                          name: "Abdullah G.",
                          rating: "5",
                          videoUrl:
                              "https://youtube.com/shorts/J5yioLXTxQs?si=BG3TybpqxsAosV92",
                        ),
                        SizedBox(height: 20),
                        TestimonialCard(
                          text:
                              "I was stuck in a cycle of failing prop firm challenges until\nI found RapidRobo 3.0. It passed both phases of my E8 I\nchallenge smoothly. The automation and risk\nmanagement are top-notch, and customer support\nwas always there to guide me. This is a game-changer!",
                          name: "Keith",
                          rating: "5",
                          imageUrl: "assets/images/personal_testimonial.png",
                        ),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TestimonialCard(
                            text:
                                "RapidRobo 3.0 is the real deal! I work full-time and\ncouldn’t afford to sit and trade all day. This bot\nhandled everything and passed my challenge while\nI focused on other things. If you want a reliable, \nstress-free way to get funded, this is it!",
                            name: "Abdullah G.",
                            rating: "5",
                            videoUrl:
                                "https://www.youtube.com/watch?v=Uwmp16aSgdk",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TestimonialCard(
                            text:
                                "I was stuck in a cycle of failing prop firm challenges until\nI found RapidRobo 3.0. It passed both phases of my E8 I\nchallenge smoothly. The automation and risk\nmanagement are top-notch, and customer support\nwas always there to guide me. This is a game-changer!",
                            name: "Keith.",
                            rating: "4",
                            imageUrl: "assets/images/personal_testimonial.png",
                          ),
                        ),
                      ],
                    );
            },
          ),
          const SizedBox(height: 20),

          // ✅ Action Buttons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: [
              // CTA Button
              CTAButton(
                text: "Message Our Team Now",
                subtext: "Our Team Of Experts Replies Within Minutes",
                icon: Icons.send,
                color: Colors.blueAccent,
                onPressed: () async {
                  print("CTA button pressed");
                  final Uri telegramUrl =
                      Uri.parse("https://t.me/rapidrobosupport");
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
              CTAButton(
                text: "Check Our Results - channel",
                subtext: "Our Team Of Expert Replies Within Minutes",
                icon: Icons.send,
                color: Colors.blueAccent,
                onPressed: () async {
                  print("CTA button pressed");
                  final Uri telegramUrl = Uri.parse("https://t.me/rapidrobo");
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
          ),
        ],
      ),
    );
  }
}

// ✅ Image Carousel Widget with Responsive Size
