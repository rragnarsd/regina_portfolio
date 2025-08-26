import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveX on BuildContext {
  bool get isMobileOrTablet {
    final breakpoints = ResponsiveBreakpoints.of(this);
    return breakpoints.isMobile || breakpoints.isTablet;
  }
}
