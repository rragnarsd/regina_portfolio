import 'package:flutter/material.dart';
import 'package:regina_portfolio/utils/colors.dart';

class AppTextStyles {
  static const Color primaryColor = AppColors.primaryA10;
  static const Color secondaryColor = AppColors.surfaceA0;

  static TextStyle regular({
    double fontSize = 14,
    Color color = primaryColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);

  static TextStyle bold({
    double fontSize = 14,
    Color color = primaryColor,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
}

final textFieldDecoration = InputDecoration(
  errorStyle: TextStyle(color: AppColors.error),
  alignLabelWithHint: true,
  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
  prefix: const Padding(padding: EdgeInsets.only(left: 16.0)),
  hintStyle: TextStyle(color: AppColors.surfaceA50.withValues(alpha: 0.8)),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.tonalSurfaceA50),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.tonalSurfaceA50, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.error),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColors.error, width: 2),
  ),
);

final buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.primaryA20,
  padding: const EdgeInsets.all(16.0),
  disabledBackgroundColor: AppColors.tonalSurfaceA50,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
);
