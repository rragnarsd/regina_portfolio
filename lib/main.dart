import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:regina_portfolio/contact/contact_provider.dart';
import 'package:regina_portfolio/contact/contact_section.dart';
import 'package:regina_portfolio/profile/profile_section.dart';
import 'package:regina_portfolio/project/project_section.dart';
import 'package:regina_portfolio/utils/colors.dart';
import 'package:regina_portfolio/utils/constants.dart';
import 'package:regina_portfolio/utils/enums.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: MaterialApp(
        title: AppConstants.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
        home: const PortfolioHome(),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
      ).animate().fadeIn(duration: 400.milliseconds),
    );
  }
}

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
      backgroundColor: AppColors.surfaceA0,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    Images.worldImage,
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
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                AppConstants.copyrightNotice,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.tonalSurfaceA50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
