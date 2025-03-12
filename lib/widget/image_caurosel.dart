import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageList;

  const ImageCarousel({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;
    bool isMobile = screenWidth < 400;

    return CarouselSlider(
      options: CarouselOptions(
        height: isTablet ? 500 : (isMobile ? 250 : 350),
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: isTablet ? 16 / 8 : 16 / 9,
        viewportFraction: isMobile ? 0.9 : 0.8,
      ),
      items: imageList.map((imagePath) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}
