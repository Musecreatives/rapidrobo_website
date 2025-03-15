import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _padding = 40;

  @override
  void initState() {
    super.initState();
    // Trigger animation after build
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
        _padding = 20;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;
      double logoHeight = isMobile ? 60 : 80;
      double titleFontSize = isMobile ? 24 : 30;
      double subtitleFontSize = isMobile ? 18 : 25;
      double spacing = isMobile ? 10 : 20;

      return AnimatedPadding(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(_padding),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 700),
          opacity: _opacity,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  height: logoHeight,
                  child: Image.asset('assets/icons/logo_icon.png'),
                ),
              ),
              SizedBox(height: spacing / 2),
              Text(
                "RAPIDROBOEA",
                style: GoogleFonts.montserrat(
                  fontSize: titleFontSize,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: spacing / 2),
              Text(
                "Passes FTMO Accounts, Get Payout And Use On Your Personal Accounts!",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
