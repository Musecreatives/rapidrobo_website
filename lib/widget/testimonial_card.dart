import 'dart:ui_web' as ui_web;
import 'dart:html' as html;
import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    Key? key,
    required this.text,
    required this.name,
    required this.rating,
    this.videoUrl,
    this.imageUrl,
  })  : assert(videoUrl != null || imageUrl != null,
            'Either videoUrl or imageUrl must be provided'),
        super(key: key);

  final String text;
  final String name;
  final String rating;
  final String? videoUrl;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;
    bool isDesktop = screenWidth > 1000;

    // YouTube Video Embedding for Flutter Web
    if (videoUrl != null) {
      final String viewType = 'youtube-iframe-${videoUrl.hashCode}';

      ui_web.platformViewRegistry.registerViewFactory(
        viewType,
        (int viewId) {
          final html.IFrameElement iframe = html.IFrameElement()
            ..width = '100%'
            ..height = isDesktop
                ? '315'
                : isTablet
                    ? '250'
                    : '180'
            ..src = videoUrl!.replaceFirst('watch?v=', 'embed/')
            ..style.border = 'none'
            ..allowFullscreen = true;
          return iframe;
        },
      );

      return _buildTestimonialCard(
        context,
        mediaWidget: SizedBox(
          height: isDesktop
              ? 315
              : isTablet
                  ? 250
                  : 180,
          child: HtmlElementView(viewType: viewType),
        ),
      );
    }

    // Image Display if No Video
    return _buildTestimonialCard(
      context,
      mediaWidget: Container(
        height: isTablet ? 180 : 150,
        width: isTablet ? 180 : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl!),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(BuildContext context,
      {required Widget mediaWidget}) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Container(
      width: isTablet ? 400 : double.infinity,
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mediaWidget,
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
