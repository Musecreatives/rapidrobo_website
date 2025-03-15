import 'package:flutter/material.dart';
import 'package:rapidrobo/HomePage/home_Page.dart';
import 'package:rapidrobo/rapidaroboEApage/rapidroboEA.dart';
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
                            NavItemPage2("Home"),
                            NavItem("Testimonials", 1600, widget.controller),
                            const SizedBox(height: 10),
                            NavItem(
                                "Join Free Channel", 800, widget.controller),
                            const SizedBox(height: 10),
                            NavItemPage("RapidRobo EA"),
                            const SizedBox(height: 10),
                            NavItem("Contact Us", 5000, widget.controller),
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
                    NavItemPage2("Home"),
                    NavItem("Testimonials", 1600, widget.controller),
                    const SizedBox(height: 10),
                    NavItem("Join Free Channel", 800, widget.controller),
                    const SizedBox(height: 10),
                    NavItemPage("RapidRobo EA"),
                    const SizedBox(height: 10),
                    NavItem("Contact Us", 5000, widget.controller),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

// Existing NavItem for scrolling
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

// New NavItem for navigating to a different page
class NavItemPage extends StatelessWidget {
  final String title;

  const NavItemPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RapidRoboWeb()), // Navigate to AboutPage
          );
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

// New NavItem for navigating to a different page
class NavItemPage2 extends StatelessWidget {
  final String title;

  const NavItemPage2(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()), // Navigate to AboutPage
          );
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
