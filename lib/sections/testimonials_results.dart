import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          videoUrl: "https://example.com/video.mp4",
                        ),
                        SizedBox(height: 20),
                        TestimonialCard(
                          text:
                              "I was stuck in a cycle of failing prop firm challenges until\nI found RapidRobo 3.0. It passed both phases of my E8 I\nchallenge smoothly. The automation and risk\nmanagement are top-notch, and customer support\nwas always there to guide me. This is a game-changer!",
                          name: "Keith",
                          rating: "5",
                          imageUrl: "/images/personal_testimonial.png",
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
                            name: "Ferris F.",
                            rating: "5",
                            videoUrl: "https://example.com/video.mp4",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TestimonialCard(
                            text:
                                "I was stuck in a cycle of failing prop firm challenges until\nI found RapidRobo 3.0. It passed both phases of my E8 I\nchallenge smoothly. The automation and risk\nmanagement are top-notch, and customer support\nwas always there to guide me. This is a game-changer!",
                            name: "Keith.",
                            rating: "4",
                            imageUrl: "/images/personal_testimonial.png",
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
class ImageCarousel extends StatelessWidget {
  final List<String> imageList;

  const ImageCarousel({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;
    bool isMobile = screenWidth < 400;

    return CarouselSlider(
      options: CarouselOptions(
        height: isTablet ? 500 : (isMobile ? 250 : 350),
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: isTablet ? 16 / 8 : 16 / 9,
        viewportFraction: isMobile ? 0.9 : 0.8,
      ),
      items: imageList.map((imagePath) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  /// Either provide a [videoUrl] or an [imageUrl]. One of them must be non-null.
  const TestimonialCard({
    Key? key,
    required this.text,
    required this.name,
    required this.rating,
    this.videoUrl,
    this.imageUrl,
  })  : assert(videoUrl != null || imageUrl != null,
            'Either videoUrl or imageUrl must be provided'),
        super(key: key);

  final String text;
  final String name;
  final String rating;
  final String? videoUrl;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    // Choose the media widget: if videoUrl is provided, show a video placeholder,
    // otherwise, display an image.
    Widget mediaWidget;
    if (videoUrl != null) {
      // For video, we use an icon placeholder. You can extend this to a real video player.
      mediaWidget = Container(
        height: isTablet ? 180 : 150,
        width: isTablet ? 180 : 150,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.play_circle_fill,
          size: 50,
          color: Colors.white,
        ),
      );
    } else {
      mediaWidget = Container(
        height: isTablet ? 180 : 150,
        width: isTablet ? 180 : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Media widget (video or image)
          mediaWidget,
          const SizedBox(height: 10),
          // Name
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          // Testimonial text
          Text(
            text,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          // Star Ratings (using the rating string for now, or you could convert it to a number)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
