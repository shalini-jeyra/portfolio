import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Obsidian & Gold palette
  static const Color background = Color(0xFF0E0E0E);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceElevated = Color(0xFF242424);
  static const Color goldAccent = Color(0xFFC9A84C);
  static const Color goldAccentLight = Color(0xFFE8C96A);
  static const Color offWhite = Color(0xFFF5F0E8);
  static const Color offWhiteMuted = Color(0xFFAFA9A0);
  static const Color divider = Color(0xFF2C2C2C);
  static const Color cardBorder = Color(0xFF333333);

  static const LinearGradient goldGradient = LinearGradient(
    colors: [goldAccent, goldAccentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient bgGradient = LinearGradient(
    colors: [Color(0xFF0E0E0E), Color(0xFF141414), Color(0xFF0E0E0E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        background: AppColors.background,
        surface: AppColors.surface,
        primary: AppColors.goldAccent,
        secondary: AppColors.goldAccentLight,
        onBackground: AppColors.offWhite,
        onSurface: AppColors.offWhite,
      ),
      textTheme: GoogleFonts.cormorantTextTheme().copyWith(
        displayLarge: GoogleFonts.cormorant(
          fontSize: 72,
          fontWeight: FontWeight.w700,
          color: AppColors.offWhite,
          height: 1.05,
          letterSpacing: -2,
        ),
        displayMedium: GoogleFonts.cormorant(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: AppColors.offWhite,
          height: 1.1,
          letterSpacing: -1,
        ),
        displaySmall: GoogleFonts.cormorant(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: AppColors.offWhite,
        ),
        headlineLarge: GoogleFonts.cormorant(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.offWhite,
        ),
        headlineMedium: GoogleFonts.cormorant(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.offWhite,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 16,
          color: AppColors.offWhiteMuted,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontSize: 14,
          color: AppColors.offWhiteMuted,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.goldAccent,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
