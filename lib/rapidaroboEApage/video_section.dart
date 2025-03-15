import 'package:flutter/material.dart';
import 'package:rapidrobo/rapidaroboEApage/rapidroboEA.dart';
import 'dart:ui_web' as ui_web;
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class VideoSection extends StatefulWidget {
  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.8;
  double _buttonOpacity = 0;

  @override
  void initState() {
    super.initState();

    // Trigger animations after the widget is built
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
        _scale = 1.0;
      });
    });

    // Slight delay for button animation
    Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        _buttonOpacity = 1;
      });
    });

    // Register YouTube iFrame for Web
    ui_web.platformViewRegistry.registerViewFactory(
      'youtube-iframe',
      (int viewId) {
        final html.IFrameElement iframe = html.IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src =
              'https://www.youtube.com/embed/8-8iK4grHIE?si=UH7yzpPqyXe4WxcX'
          ..style.border = 'none'
          ..allow =
              'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
          ..allowFullscreen = true;

        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;

        return AnimatedOpacity(
          duration: Duration(milliseconds: 700),
          opacity: _opacity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Video Container with Animation
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  transform: Matrix4.diagonal3Values(_scale, _scale, 1),
                  width: isMobile ? width * 0.9 : 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: HtmlElementView(viewType: 'youtube-iframe'),
                  ),
                ),

                const SizedBox(height: 30),

                // Animated Buttons
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  opacity: _buttonOpacity,
                  child: buildCTAButtons(isMobile),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCTAButtons(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth > 600
              ? 400
              : double.infinity, // Adjust for web
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Book A Call",
                      icon: Icons.phone,
                      color: Colors.blueAccent,
                      onPressed: () => _launchURL("tel:+447784255751"),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textColor: Colors.black,
                      text: "Get Free Trial",
                      icon: Icons.shopping_cart_checkout_rounded,
                      color: Colors.white,
                      onPressed: () => _launchURL("http://eepurl.com/jacfS2"),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textColor: Colors.white,
                      text: "Buy Now",
                      icon: Icons.telegram,
                      color: Colors.deepPurpleAccent.shade700,
                      onPressed: () => _launchURL(
                          "https://tradercentral.co/products/rapidrobo-crypto-bot"),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Book A Call",
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                        icon: Icons.phone,
                        onPressed: () => _launchURL("tel:+447784255751"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        textColor: Colors.black,
                        text: "Get Free Trial",
                        icon: Icons.shopping_cart_checkout_rounded,
                        color: Colors.white,
                        onPressed: () => _launchURL("http://eepurl.com/jacfS2"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        textColor: Colors.white,
                        text: "Buy Now",
                        icon: Icons.telegram,
                        color: Colors.deepPurpleAccent.shade700,
                        onPressed: () => _launchURL(
                            "https://tradercentral.co/products/rapidrobo-crypto-bot"),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  static Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch $url");
    }
  }
}
