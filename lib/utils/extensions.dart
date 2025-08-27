import 'package:flutter/material.dart';
import 'package:regina_portfolio/utils/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveX on BuildContext {
  bool get isMobileOrTablet {
    final breakpoints = ResponsiveBreakpoints.of(this);
    return breakpoints.isMobile || breakpoints.isTablet;
  }
}

extension SnackBarExtensions on BuildContext {
  void showSnackBar(
    String message, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: AppColors.surfaceA50.withValues(alpha: 0.2),
    );
  }

  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: AppColors.error);
  }
}
