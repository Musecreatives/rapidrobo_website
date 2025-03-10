import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapidrobo/sections/footer_section.dart';
import 'package:rapidrobo/sections/getaccount.dart';
import 'package:rapidrobo/widget/navbar.dart';
import '../sections/constant_payouts.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/pass_challenge_section.dart';
import '../sections/personal_testimonial.dart';
import '../sections/pick_a_passage_section.dart';
import '../sections/testimonials_results.dart';
import '../sections/trading_section.dart';
import 'home_Controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          return SingleChildScrollView(
            controller: controller.scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width > 1000
                    ? 80
                    : width > 600
                        ? 40
                        : 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Navbar
                  Container(
                    alignment: Alignment.center,
                    child: NavBar(controller: controller),
                  ),

                  SizedBox(height: width > 1000 ? 60 : 30),

                  // Hero Section
                  const HeroSection(),

                  SizedBox(height: 40),

                  // Trading Section
                  const TradingSection(),

                  SizedBox(height: 40),

                  // Testimonials
                  const TestimonialsSection(),

                  SizedBox(height: 40),

                  // Pass Challenge Section
                  const PassChallengeSection(),

                  SizedBox(height: 40),

                  // Contact Section
                  const ContactSection(),

                  SizedBox(height: 40),

                  // Pick A Passage Section
                  const PickAPassageSection(),

                  SizedBox(height: 40),

                  // Get Account Section
                  const GetAccountSection(),

                  SizedBox(height: 40),

                  // Constant Payouts
                  const ConstantPayouts(),

                  SizedBox(height: 40),

                  // Personal Testimonial Section
                  const TestimonialSection(),

                  SizedBox(height: 40),

                  // Footer Section
                  const FooterSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
