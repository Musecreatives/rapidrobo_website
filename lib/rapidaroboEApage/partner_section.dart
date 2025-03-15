import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnersSection extends StatefulWidget {
  @override
  _PartnersSectionState createState() => _PartnersSectionState();
}

class _PartnersSectionState extends State<PartnersSection>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  List<double> _scales = [0.8, 0.8, 0.8, 0.8, 0.8];

  @override
  void initState() {
    super.initState();

    // Fade-in and scale animations
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Staggered scaling animation for logos
    for (int i = 0; i < _scales.length; i++) {
      Future.delayed(Duration(milliseconds: 500 + (i * 200)), () {
        setState(() {
          _scales[i] = 1.0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 700),
      opacity: _opacity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "We Partner With Top Prop Firms & Brokers",
              style: GoogleFonts.montserrat(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                bool isLargeScreen = constraints.maxWidth > 800;

                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: isLargeScreen
                      ? _buildLargeScreenLayout()
                      : _buildSmallScreenLayout(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeScreenLayout() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAnimatedLogo('assets/icons/icon_1.png', 0),
          _buildAnimatedLogo('assets/icons/icon_2.png', 1),
        ],
      ),
      const SizedBox(height: 20),
      _buildAnimatedLogo('assets/icons/icon_3.png', 2),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAnimatedLogo('assets/icons/icon_4.png', 3),
          _buildAnimatedLogo('assets/icons/icon_5.png', 4),
        ],
      )
    ]);
  }

  Widget _buildSmallScreenLayout() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        for (int i = 0; i < 5; i++)
          _buildAnimatedLogo('assets/icons/icon_${i + 1}.png', i),
      ],
    );
  }

  Widget _buildAnimatedLogo(String assetPath, int index) {
    return AnimatedScale(
      scale: _scales[index],
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      child: Image.asset(assetPath, height: 50),
    );
  }
}
