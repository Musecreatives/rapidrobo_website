import 'package:flutter/material.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700; // Define breakpoint

        return Padding(
          padding: const EdgeInsets.all(20),
          child: isMobile
              ? Column(
                  children: [
                    _buildTestimonialCard(
                      image: AssetImage('/images/samuel.png'),
                      review:
                          "I was skeptical at first, but RapidRobo 3.0 proved me wrong! It\npassed my FTMO challenge in record time, and now I’m trading\non a funded account stress-free. The risk management is solid,\nand it adapts well to market conditions. Highly recommend to\nanyone serious about getting funded!",
                      name: "Samuel",
                      location: "United States",
                    ),
                    const SizedBox(height: 20),
                    _buildTestimonialCard(
                      image: AssetImage('/images/eoin.png'),
                      review:
                          "Their account management service completely transformed my trading. I no longer stress about risk management, and my funded account is growing steadily.",
                      name: "Eoin.",
                      location: "Germany",
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildTestimonialCard(
                        image: AssetImage('/images/eoin.png'),
                        review:
                            "I was stuck in a cycle of failing prop firm challenges until I found"
                            "RapidRobo 3.0. It passed both phases of my E8 challenge"
                            "smoothly. The automation and risk management are top-notch,"
                            "and customer support was always there to guide me. This is a"
                            "game-changer!",
                        name: "Eoin",
                        location: "Germany",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTestimonialCard(
                        image: AssetImage('/images/samuel.png'),
                        review:
                            "I was skeptical at first, but RapidRobo 3.0 proved me wrong! It\npassed my FTMO challenge in record time, and now I’m trading\non a funded account stress-free. The risk management is solid,\nand it adapts well to market conditions. Highly recommend to\nanyone serious about getting funded!",
                        name: "Samuel",
                        location: "United States",
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTestimonialCard({
    required String review,
    required String name,
    required String location,
    required ImageProvider image,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Star Ratings
          Row(
            children: List.generate(5, (index) {
              return const Icon(Icons.star, color: Colors.amber, size: 18);
            }),
          ),
          const SizedBox(height: 10),

          // Review Text
          Text(
            review,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 15),

          // User Info
          Row(
            children: [
              // Profile Placeholder
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(image: image)),
              const SizedBox(width: 10),

              // User Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
