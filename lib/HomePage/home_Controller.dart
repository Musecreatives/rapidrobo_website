import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  void scrollToSection(double position) {
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
