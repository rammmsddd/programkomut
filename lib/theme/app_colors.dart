import 'package:flutter/material.dart';

class AppColors {
  // Light Mode Colors
  static const gradientStart = Color(0xFF2563EB); // blue-600
  static const gradientEnd = Color(0xFF4F46E5); // indigo-700

  static const darkGradientStart = Color(0xFF3730A3); // indigo-900
  static const darkGradientEnd = Color(0xFF1E3A8A); // blue-900

  static const favoriteYellow = Color(0xFFFBBF24); // yellow-400

  static const lightBackground = Color(0xFFF9FAFB); // gray-50
  static const darkBackground = Color(0xFF111827); // gray-900

  static const lightCardBackground = Colors.white;
  static const darkCardBackground = Color(0xFF1F2937); // gray-800

  static const lightBorder = Color(0xFFF3F4F6); // gray-100
  static const darkBorder = Color(0xFF374151); // gray-700

  static const lightTextPrimary = Color(0xFF111827); // gray-900
  static const darkTextPrimary = Color(0xFFF9FAFB); // gray-100

  static const lightTextSecondary = Color(0xFF6B7280); // gray-500
  static const darkTextSecondary = Color(0xFF9CA3AF); // gray-400

  static const accentBlue = Color(0xFF2563EB); // blue-600
  static const accentBlueDark = Color(0xFF60A5FA); // blue-400

  // Glass Morphism
  static const glassWhite = Color(0x1AFFFFFF);
  static const glassBlack = Color(0x1A000000);
}

class AppGradients {
  static const headerLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
  );

  static const headerDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.darkGradientStart, AppColors.darkGradientEnd],
  );
}
