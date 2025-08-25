import 'dart:async';

import 'package:flutter/material.dart';
import 'package:regina_portfolio/enums.dart';
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
    final isMobileOrTablet =
        ResponsiveBreakpoints.of(context).isMobile ||
        ResponsiveBreakpoints.of(context).isTablet;

    final spacing = isMobileOrTablet ? 32.0 : 46.0;
    return MaxWidthBox(
      maxWidth: 1200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          children: tabs.map((tab) {
            final isActive = tab == selectedTab;
            return Padding(
              padding: EdgeInsets.only(right: spacing),
              child: InkWell(
                onTap: () => onTabSelected(tab),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tab.label.toUpperCase(),
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.grey,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 2,
                      width: isMobileOrTablet ? 100 : 160,
                      color: isActive ? Colors.white : Colors.grey[600],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1200,
      padding: EdgeInsets.symmetric(horizontal: 32.0),
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
    return Placeholder(
      color: Colors.white,
      strokeWidth: 1,
      fallbackHeight: 400,
      fallbackWidth: double.infinity,
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
            fontSize: isDesktop ? 18 : 16,
            color: Color(0xffE0E0E0),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...Interest.values.map(
              (interest) => Text(
                isDesktop
                    ? '${interest.label}${interest == Interest.values.last ? '' : '  |  '}'
                    : '${interest.label}  |  ',
                style: TextStyle(
                  fontSize: isDesktop ? 18 : 16,
                  color: Color(0xffE0E0E0),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return Container(
      color: const Color(0xffA1A1A1).withValues(alpha: 0.2),
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
}
