import 'dart:async';

import 'package:flutter/material.dart';
import 'package:regina_portfolio/utils/colors.dart';
import 'package:regina_portfolio/utils/enums.dart';
import 'package:regina_portfolio/utils/extensions.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final List<TabItem> tabs;
  final TabItem selectedTab;
  final ValueChanged<TabItem> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final spacing = context.isMobileOrTablet ? 32.0 : 46.0;

    return MaxWidthBox(
      maxWidth: 1200,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobileOrTablet ? 16.0 : 32.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: tabs.map((tab) {
              final isActive = tab == selectedTab;

              return Padding(
                padding: EdgeInsets.only(right: spacing),
                child: InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () => onTabSelected(tab),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          color: isActive
                              ? AppColors.primaryA0
                              : AppColors.tonalSurfaceA50,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                        child: Text(tab.label.toUpperCase()),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.only(top: 8),
                        height: 2,
                        width: context.isMobileOrTablet ? 80 : 160,
                        color: isActive
                            ? AppColors.primaryA0
                            : AppColors.tonalSurfaceA50,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 852;
    return MaxWidthBox(
      maxWidth: 1200,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32.0 : 0),
      child: Column(
        children: [_InterestBanner(), SizedBox(height: 32), _ProfileAbout()],
      ),
    );
  }
}

class _ProfileAbout extends StatelessWidget {
  const _ProfileAbout();

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 852;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 0.0 : 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.tonalSurfaceA30),
        ),
        padding: EdgeInsets.all(context.isMobileOrTablet ? 16.0 : 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '👋 Welcome',
              style: TextStyle(
                fontSize: context.isMobileOrTablet ? 20 : 24,
                color: AppColors.primaryA10,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),
            _ProfileSection(),
            const SizedBox(height: 32),
            Divider(color: AppColors.tonalSurfaceA30, thickness: 1),
            const SizedBox(height: 32),
            _FlagSection(),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I’m Regina, a passionate Mobile Developer with over 3 years of experience building high-quality, cross-platform applications using Flutter. With a diverse background, a Diploma in Programming, a Bachelor’s degree in Anthropology, and a Vocational degree in Graphic Media. I bring together technical expertise, creativity, and a unique perspective on problem-solving. I thrive on bringing designs and wireframes to life, turning them into beautiful, responsive, and intuitive apps. My natural curiosity keeps me exploring new technologies and refining my craft.',
          style: TextStyle(
            fontSize: context.isMobileOrTablet ? 14 : 16,
            color: AppColors.primaryA10,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '💡 What I’m passionate about',
          style: TextStyle(
            fontSize: context.isMobileOrTablet ? 14 : 16,
            color: AppColors.primaryA10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✔️ Creating seamless user experiences from UI/UX designs',
              style: TextStyle(
                fontSize: context.isMobileOrTablet ? 14 : 16,
                color: AppColors.primaryA10,
              ),
            ),
            Text(
              '✔️ Writing clean, efficient, and maintainable code',
              style: TextStyle(
                fontSize: context.isMobileOrTablet ? 14 : 16,
                color: AppColors.primaryA10,
              ),
            ),
            Text(
              '✔️ Continuously learning and exploring emerging technologies',
              style: TextStyle(
                fontSize: context.isMobileOrTablet ? 14 : 16,
                color: AppColors.primaryA10,
              ),
            ),
            Text(
              '✔️ Blending creativity with functionality',
              style: TextStyle(
                fontSize: context.isMobileOrTablet ? 14 : 16,
                color: AppColors.primaryA10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FlagSection extends StatelessWidget {
  const _FlagSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '✅ Flags collected:',
          style: TextStyle(
            fontSize: context.isMobileOrTablet ? 14 : 16,
            color: AppColors.primaryA10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            ...CountryFlag.values.map((flag) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Tooltip(
                  message: flag.title,
                  decoration: BoxDecoration(
                    color: AppColors.tonalSurfaceA30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    flag.emoji,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryA10,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}

class _InterestBanner extends StatefulWidget {
  const _InterestBanner();

  @override
  _InterestBannerState createState() => _InterestBannerState();
}

class _InterestBannerState extends State<_InterestBanner> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 24), (timer) {
      if (_scrollController.hasClients) {
        _scrollPosition += 1;
        if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
          _scrollPosition = 0;
        }
        _scrollController.jumpTo(_scrollPosition);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 852;

    final rowContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'I’m interested in: ',
          style: TextStyle(
            fontSize: context.isMobileOrTablet ? 14 : 16,
            color: AppColors.primaryA10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...(() {
              return _sortedInterests.map(
                (interest) => Text(
                  isDesktop
                      ? '${interest.label}${interest == _sortedInterests.last ? '' : '  |  '}'
                      : '${interest.label}  |  ',
                  style: TextStyle(
                    fontSize: context.isMobileOrTablet ? 14 : 16,
                    color: AppColors.primaryA10,
                  ),
                ),
              );
            })(),
          ],
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.surfaceA50.withValues(alpha: 0.2),
      ),

      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32.0 : 0,
        vertical: 16.0,
      ),
      child: isDesktop
          ? rowContent
          : SizedBox(
              height: 24,
              width: double.infinity,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) => rowContent,
              ),
            ),
    );
  }

  List<Interest> get _sortedInterests {
    final interests = Interest.values.toList();
    interests.sort((a, b) => a.label.compareTo(b.label));
    return interests;
  }
}
