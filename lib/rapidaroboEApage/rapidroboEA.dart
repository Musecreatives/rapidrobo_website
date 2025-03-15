import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidrobo/rapidaroboEApage/reward_section.dart';
import 'package:rapidrobo/widget/image_caurosel.dart';

import '../HomePage/home_Controller.dart';
import '../sections/footer_section.dart';
import '../widget/navbar.dart';
import 'header_section.dart';
import 'info_section.dart';
import 'partner_section.dart';
import 'video_section.dart';

class RapidRoboWeb extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        return SingleChildScrollView(
          child: Column(
            children: [
              // Navbar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width > 1000
                      ? 80
                      : width > 600
                          ? 40
                          : 20,
                  vertical: 20,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: NavBar(controller: controller),
                ),
              ),
              SizedBox(height: width > 1000 ? 60 : 30),
              HeaderSection(),
              VideoSection(),
              PartnersSection(),
              SizedBox(
                height: 30,
              ),
              InfoSection(),
              RewardSection(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width > 1000
                      ? 80
                      : width > 600
                          ? 40
                          : 20,
                  vertical: 20,
                ),
                child: ReviewSection(),
              ),
              FooterSection(),
            ],
          ),
        );
      }),
    );
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
    this.textColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor),
      label: Text(text,
          style: TextStyle(
              fontSize: 16, color: textColor, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 5,
      ),
    );
  }
}
