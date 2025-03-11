import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../widget/cta_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/herobanner.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textSlideAnimation;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0), // Slide in from left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0), // Slide in from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1000;

        Widget leftContent = SlideTransition(
          position: _textSlideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Pass Your Challenge or Pay Nothing -\n",
                    style: TextStyle(
                      fontSize: isMobile
                          ? 26
                          : isTablet
                              ? 34
                              : 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: const [
                      TextSpan(
                        text: "It’s that simple!",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Rapidrobo Pass: Simplifying Prop Firm Funding for You!\n"
                  "✅ Prop firm passing and funding\n"
                  "✅ Prop firm live account management\n"
                  "✅ Prop firm experts with over 250+ funded clients",
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                CTAButton(
                  text: 'Check Our Results - Channel',
                  subtext: 'Our Team Of Experts Replies Within Minutes',
                  icon: Icons.telegram,
                  color: Colors.blue,
                  onPressed: () async {
                    final telegramLink = Uri.parse('https://t.me/rapidrobo');
                    if (await canLaunchUrl(telegramLink)) {
                      await launchUrl(telegramLink,
                          mode: LaunchMode.externalApplication);
                    } else {
                      print('Telegram app not installed');
                    }
                  },
                ),
                const SizedBox(height: 30),
                AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 800),
                  child: SlideAnimation(
                    horizontalOffset: -50.0,
                    child: FadeInAnimation(
                      child: Wrap(
                        alignment: isMobile
                            ? WrapAlignment.center
                            : WrapAlignment.start,
                        spacing: 12,
                        runSpacing: 12,
                        children: const [
                          HeroImageCard(imagePath: 'assets/icons/icon_1.png'),
                          HeroImageCard(imagePath: 'assets/icons/icon_2.png'),
                          HeroImageCard(imagePath: 'assets/icons/icon_3.png'),
                          HeroImageCard(imagePath: 'assets/icons/icon_4.png'),
                          HeroImageCard(imagePath: 'assets/icons/icon_5.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        if (isMobile) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 20
                  : isTablet
                      ? 40
                      : 80,
              vertical: isMobile ? 20 : 40,
            ),
            child: leftContent,
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 20
                  : isTablet
                      ? 40
                      : 80,
              vertical: isMobile ? 20 : 40,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: leftContent),
                const SizedBox(width: 200),
                Flexible(
                  flex: 1,
                  child: SlideTransition(
                    position: _imageSlideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: isTablet ? 400 : 500,
                        ),
                        child: Image.asset(
                          'assets/images/home_banner.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
