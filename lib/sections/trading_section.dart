import 'dart:ui_web' as ui_web;
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
              'https://www.youtube.com/embed/8-8iK4grHIE?si=UH7yzpPqyXe4WxcX' // Replace with your video link
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
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobosupport');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    CTAButton(
                      text: "Check Our Results - Channel",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.play_circle_fill,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobo');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    CTAButton(
                      text: "Book A Call",
                      subtext: "Contact us now",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        print("CTA button pressed");
                        // Use the tel: scheme and remove any spaces in the phone number
                        final Uri phoneUri = Uri.parse("tel:+447784255751");
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(
                            phoneUri,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          print("Could not launch $phoneUri");
                        }
                      },
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
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobosupport');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    CTAButton(
                      text: "Check Our Results - Channel",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.play_circle_fill,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobo');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    CTAButton(
                      text: "Book A Call",
                      subtext: "Contact us now",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        print("CTA button pressed");
                        // Use the tel: scheme and remove any spaces in the phone number
                        final Uri phoneUri = Uri.parse("tel:+447784255751");
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(
                            phoneUri,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          print("Could not launch $phoneUri");
                        }
                      },
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
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobosupport');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    CTAButton(
                      text: "Check Our Results - Channel",
                      subtext: "Our Team Of Experts Replies Within Minutes",
                      icon: Icons.play_circle_fill,
                      color: Colors.deepPurpleAccent,
                      onPressed: () async {
                        // Replace with your Telegram channel/profile link
                        final telegramLink =
                            Uri.parse('https://t.me/rapidrobo');

                        // Check if the Telegram app is installed
                        if (await canLaunchUrl(telegramLink)) {
                          await launchUrl(telegramLink,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Telegram app not installed, handle accordingly (e.g., show a message)
                          print('Telegram app not installed');
                        }
                      },
                    ),
                    CTAButton(
                      text: "Book A Call",
                      subtext: "Contact us now",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () async {
                        print("CTA button pressed");
                        // Use the tel: scheme and remove any spaces in the phone number
                        final Uri phoneUri = Uri.parse("tel:+447784255751");
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(
                            phoneUri,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          print("Could not launch $phoneUri");
                        }
                      },
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
