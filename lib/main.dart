import 'package:flutter/material.dart';
import 'package:regina_portfolio/contact_section.dart';
import 'package:regina_portfolio/enums.dart';
import 'package:regina_portfolio/profile_section.dart';
import 'package:regina_portfolio/project_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Regina Portfolio',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: PortfolioHome(),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}

//TODO - Add microinteractions
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  TabItem _selectedTab = TabItem.profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //TODO - Add Hi, my name is Regina?
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "assets/worldmap.png",
                    fit: BoxFit.contain,
                    opacity: const AlwaysStoppedAnimation(0.6),
                  ),
                ),
                ProfileTab(
                  tabs: TabItem.values,
                  selectedTab: _selectedTab,
                  onTabSelected: (tab) => setState(() => _selectedTab = tab),
                ),
                const SizedBox(height: 46),
                switch (_selectedTab) {
                  TabItem.profile => const ProfileTabView(),
                  TabItem.projects => ProjectTab(),
                  TabItem.contact => const ContactTab(),
                },
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    '© 2025 Regina. All rights reserved.',
                    style: TextStyle(fontSize: 12, color: Color(0xffE0E0E0)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
