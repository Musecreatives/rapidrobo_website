import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              return constraints.maxWidth > 600
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: TestimonialCard()),
                        SizedBox(width: 16),
                        Expanded(child: TestimonialCard()),
                      ],
                    )
                  : const Column(
                      children: [
                        TestimonialCard(),
                        SizedBox(height: 16),
                        TestimonialCard(),
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
              ElevatedButton.icon(
                onPressed: () {
                  // Action for messaging
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                ),
                icon: const Icon(FontAwesomeIcons.telegram,
                    color: Colors.white, size: 18),
                label: const Column(
                  children: [
                    Text("Message Our Team Now",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 4),
                    Text("Our Team Of Experts Reply Within Minutes",
                        style: TextStyle(fontSize: 12, color: Colors.white70)),
                  ],
                ),
              ),
              CTAButton(
                text: "Check Our Results - channel",
                subtext: "Our Team Of Expert Replies Within Minutes",
                icon: Icons.send,
                color: Colors.blueAccent,
                onPressed: () {},
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

// ✅ Testimonial Card Widget with Adjusted Layout
class TestimonialCard extends StatelessWidget {
  const TestimonialCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Video Placeholder
          Container(
            height: isTablet ? 180 : 150,
            width: isTablet ? 180 : 150,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.play_circle_fill,
                size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            "• Michael K.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Michael had the strategy but struggled with execution and timing. "
            "He partnered with Rapidrobo Trading, where our professional traders "
            "handled everything for him. With disciplined risk management, he "
            "passed his challenge and now lets our team grow his funded account.",
            style: TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Star Ratings
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
