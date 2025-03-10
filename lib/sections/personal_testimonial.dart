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
                      review:
                          "I struggled with passing challenges until I found this service. They handled everything efficiently, and now I'm managing a fully funded account.",
                      name: "Ferris F.",
                      location: "United States",
                    ),
                    const SizedBox(height: 20),
                    _buildTestimonialCard(
                      review:
                          "Their account management service completely transformed my trading. I no longer stress about risk management, and my funded account is growing steadily.",
                      name: "Larry S.",
                      location: "Germany",
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildTestimonialCard(
                        review:
                            "I struggled with passing challenges until I found this service. They handled everything efficiently, and now I'm managing a fully funded account.",
                        name: "Ferris F.",
                        location: "United States",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTestimonialCard(
                        review:
                            "Their account management service completely transformed my trading. I no longer stress about risk management, and my funded account is growing steadily.",
                        name: "Larry S.",
                        location: "Germany",
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
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[800],
                ),
              ),
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
