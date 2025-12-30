import 'package:flutter/material.dart';

class AppColors {
  // ===== NEW LIGHT THEME (Referans tasarıma göre) =====

  // Light Mode Header Gradient (açık lavanta)
  static const headerGradientStart = Color(0xFFB8C9E8); // açık lavanta
  static const headerGradientEnd = Color(0xFFD4DFEF); // daha açık lavanta

  // Collections Card
  static const collectionsCard = Color(0xFFE8EEF7); // açık mavi-gri

  // Legacy gradient colors (dark mode için)
  static const gradientStart = Color(0xFF2563EB); // blue-600
  static const gradientEnd = Color(0xFF4F46E5); // indigo-700

  static const darkGradientStart = Color(0xFF3730A3); // indigo-900
  static const darkGradientEnd = Color(0xFF1E3A8A); // blue-900

  static const favoriteYellow = Color(0xFFFBBF24); // yellow-400

  // Backgrounds
  static const lightBackground = Color(0xFFF5F7FA); // açık gri-mavi
  static const darkBackground = Color(0xFF111827); // gray-900

  static const lightCardBackground = Colors.white;
  static const darkCardBackground = Color(0xFF1F2937); // gray-800

  // Borders
  static const lightBorder = Color(0xFFE5E7EB); // gray-200
  static const darkBorder = Color(0xFF374151); // gray-700

  // Text Colors
  static const lightTextPrimary = Color(0xFF1F2937); // gray-800
  static const darkTextPrimary = Color(0xFFF9FAFB); // gray-100

  static const lightTextSecondary = Color(0xFF6B7280); // gray-500
  static const darkTextSecondary = Color(0xFF9CA3AF); // gray-400

  // Accent Colors
  static const accentBlue = Color(0xFF2563EB); // blue-600
  static const accentBlueDark = Color(0xFF60A5FA); // blue-400
  static const accentBlueLight = Color(0xFFDBEAFE); // blue-100

  // Glass Morphism
  static const glassWhite = Color(0x1AFFFFFF);
  static const glassBlack = Color(0x1A000000);

  // Collection gradients
  static const collectionBlueStart = Color(0xFF3B82F6);
  static const collectionBlueEnd = Color(0xFF1D4ED8);
  static const collectionPurpleStart = Color(0xFF8B5CF6);
  static const collectionPurpleEnd = Color(0xFF6366F1);
}

class AppGradients {
  // Light mode header - açık lavanta
  static const headerLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.headerGradientStart, AppColors.headerGradientEnd],
  );

  // Dark mode header
  static const headerDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.darkGradientStart, AppColors.darkGradientEnd],
  );

  // Blue header (for modals)
  static const blueHeader = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.accentBlue, Color(0xFF1D4ED8)],
  );

  // Collection card gradients
  static const collectionBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.collectionBlueStart, AppColors.collectionBlueEnd],
  );

  static const collectionPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.collectionPurpleStart, AppColors.collectionPurpleEnd],
  );
}
