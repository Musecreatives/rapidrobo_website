import 'dart:ui_web' as ui_web;
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widget/cta_button.dart';

class TradingSection extends StatelessWidget {
  const TradingSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the YouTube iframe for Flutter Web
    ui_web.platformViewRegistry.registerViewFactory(
      'youtube-iframe',
      (int viewId) {
        final html.IFrameElement iframe = html.IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src =
              'https://www.youtube.com/embed/dQw4w9WgXcQ' // Replace with your video link
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
            horizontal: isMobile ? 20 : 40,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "We can pass & Manage Your Prop Firm Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We Also Sell Pre-Funded Accounts Ready to trade\nPayouts Available In 2 Weeks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // YouTube Video Container
              Container(
                width: isMobile ? width * 0.9 : 600,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                child: const Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Center(
                        child: Text(
                          "WELCOME TO RAPIDROBO TRADING - PLEASE WATCH THIS VIDEO FIRST",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 315,
                      child: HtmlElementView(viewType: 'youtube-iframe'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // CTA Buttons - Responsive Layout
              if (isMobile)
                Column(
                  children: [
                    CTAButton(
                      text: "Message Our Team Now",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.send,
                      color: Colors.deepPurple,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    CTAButton(
                      text: "Check Our Results - Channel",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.play_circle_fill,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    CTAButton(
                      text: "Book A Call",
                      subtext: "",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                  ],
                )
              else if (isTablet)
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    CTAButton(
                      text: "Message Our Team Now",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.send,
                      color: Colors.deepPurple,
                      onPressed: () {},
                    ),
                    CTAButton(
                      text: "Check Our Results - Channel",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.play_circle_fill,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                    CTAButton(
                      text: "Book A Call",
                      subtext: "",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CTAButton(
                      text: "Message Our Team Now",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.send,
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    CTAButton(
                      text: "Check Our Results - Channel",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.play_circle_fill,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                    CTAButton(
                      text: "Book A Call",
                      subtext: "",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
