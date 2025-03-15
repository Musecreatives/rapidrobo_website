import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidrobo/widget/image_caurosel.dart';

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
