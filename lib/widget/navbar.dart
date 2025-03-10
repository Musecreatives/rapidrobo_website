import 'package:flutter/material.dart';
import '../HomePage/home_Controller.dart';

class NavBar extends StatefulWidget {
  final HomeController controller;

  const NavBar({super.key, required this.controller});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Column(
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      Image.asset('assets/logo.png', height: 40),

                      // Menu (Desktop)
                      if (!isMobile)
                        Row(
                          children: [
                            NavItem("Contact Us", 600, widget.controller),
                            NavItem("Testimonials", 1200, widget.controller),
                            NavItem(
                                "Join Free Channel", 1800, widget.controller),
                          ],
                        ),

                      // Hamburger Icon (Mobile)
                      if (isMobile)
                        IconButton(
                          icon: Icon(
                            _isMenuOpen ? Icons.close : Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: toggleMenu,
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // Mobile Menu (Only visible when _isMenuOpen is true)
            if (isMobile && _isMenuOpen)
              Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    NavItem("Contact Us", 600, widget.controller),
                    const SizedBox(height: 10),
                    NavItem("Testimonials", 1200, widget.controller),
                    const SizedBox(height: 10),
                    NavItem("Join Free Channel", 1800, widget.controller),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final double position;
  final HomeController controller;

  const NavItem(this.title, this.position, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => controller.scrollToSection(position),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
