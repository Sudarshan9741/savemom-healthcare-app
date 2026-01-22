import 'package:flutter/material.dart';

class AppColors {
  // PRIMARY BRAND COLORS - PREMIUM MODERN 2024 STYLE
  static const Color primary = Color(0xFF6D28D9);        // Deep vibrant purple
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFEDE9FE);
  static const Color onPrimaryContainer = Color(0xFF2D1047);
  
  // ACCENT - COMPLEMENTARY VIBRANT
  static const Color accent = Color(0xFF0EA5E9);         // Vibrant sky blue
  static const Color accentContainer = Color(0xFFE0F2FE);
  
  // SECONDARY - SOPHISTICATED GRAY-BLUE
  static const Color secondary = Color(0xFF64748B);      // Slate gray
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE2E8F0);
  static const Color onSecondaryContainer = Color(0xFF1E293B);

  // TERTIARY - WARM ACCENT
  static const Color tertiary = Color(0xFFF97316);       // Warm orange
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFEDD5);

  // NEUTRAL PALETTE - PREMIUM SOFT BACKGROUNDS
  static const Color background = Color(0xFFF8FAFC);     // Ultra-light blue-gray
  static const Color onBackground = Color(0xFF0F172A);   // Deep charcoal
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1E293B);
  static const Color surfaceVariant = Color(0xFFF1F5F9);
  static const Color onSurfaceVariant = Color(0xFF475569);
  
  static const Color outline = Color(0xFFCBD5E1);
  static const Color outlineVariant = Color(0xFFE2E8F0);

  // STATUS COLORS - VIBRANT & CLEAR
  static const Color success = Color(0xFF10B981);        // Emerald green
  static const Color error = Color(0xFFEF4444);          // Vibrant red
  static const Color warning = Color(0xFFF59E0B);        // Amber
  static const Color info = Color(0xFF0EA5E9);           // Sky blue

  // PRIORITY COLORS - STRONG & DISTINCT
  static const Color highPriority = Color(0xFFDC2626);   // Bold red
  static const Color mediumPriority = Color(0xFFF59E0B); // Amber
  static const Color lowPriority = Color(0xFF10B981);    // Emerald

  // TASK STATUS COLORS
  static const Color pendingStatus = Color(0xFF3B82F6);  // Blue
  static const Color completedStatus = Color(0xFF10B981); // Green
  static const Color deniedStatus = Color(0xFFEF4444);   // Red

  // BORDERS & DIVIDERS
  static const Color divider = Color(0xFFE2E8F0);
  static const Color borderColor = Color(0xFFCBD5E1);
  
  // SHADOWS
  static const Color shadowColor = Color(0x0A000000);
  static const Color scrimColor = Color(0x99000000);
}


class AppSpacing {
  // PREMIUM SPACING - MAXIMUM BREATHING ROOM
  static const double xs = 4.0;
  static const double sm = 12.0;
  static const double md = 20.0;
  static const double lg = 28.0;
  static const double xl = 40.0;
  static const double xxl = 56.0;
}

class AppRadius {
  // PREMIUM ROUNDED CORNERS - SOFT & MODERN
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;      // Cards & major containers
  static const double xl = 28.0;      // Large elements
  static const double xxl = 32.0;     // Extra large
  static const double badge = 20.0;   // Pill-style badges
}


class AppTextStyles {
  // DISPLAY STYLES - FOR HERO SECTIONS
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
    height: 1.2,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  // HEADLINE STYLES - STRONG HIERARCHY
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.35,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.4,
  );

  // TITLE STYLES - CARD TITLES, SECTION HEADERS
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.4,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.45,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.4,
  );

  // BODY STYLES - MAIN CONTENT
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.5,
  );

  // LABEL STYLES - BUTTONS, BADGES, CHIPS
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.45,
  );

  // CAPTION STYLES - METADATA, TIMESTAMPS
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: 1.33,
    color: Color(0xFF64748B),
  );
}
