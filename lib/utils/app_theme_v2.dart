import 'package:flutter/material.dart';

/// Centralized Theme System - Single source of truth for all UI styling
class AppTheme {
  /// Premium Sky-Blue Theme (Canva-inspired)
  static ThemeData light() {
    // 🎨 PREMIUM SKY-BLUE COLOR SYSTEM
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      // Primary: Sky Blue
      primary: Color(0xFF4DA3FF),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFEAF3FF),
      onPrimaryContainer: Color(0xFF003D8F),
      // Secondary: Accent Blue
      secondary: Color(0xFF7BB6FF),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFC3E0FF),
      onSecondaryContainer: Color(0xFF001E47),
      // Tertiary: Status/Accent
      tertiary: Color(0xFF3CCB7F),
      onTertiary: Color(0xFFFFFFFF),
      // Error: Soft Red (Denied)
      error: Color(0xFFF06A6A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFE5E5),
      onErrorContainer: Color(0xFF5A1A1A),
      // Surface: Pure White & Variants
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1A2332),
      surfaceContainerHighest: Color(0xFFEEF4FF),
      onSurfaceVariant: Color(0xFF5A6B7F),
      // Outline: Soft Blue-Tinted Dividers
      outline: Color(0xFFD9E6F5),
      outlineVariant: Color(0xFFE8EFF8),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2E3840),
      onInverseSurface: Color(0xFFF1F5FB),
      inversePrimary: Color(0xFF99CCFF),
      shadow: Color(0xFF4DA3FF),
      surfaceTint: Color(0xFF4DA3FF),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,

      // ========== SCAFFOLD & BACKGROUND ==========
      scaffoldBackgroundColor: const Color(0xFFF6FAFF),

      // ========== APP BAR THEME ==========
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF6FAFF),
        foregroundColor: Color(0xFF1A2332),
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF1A2332), size: 24),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A2332),
          letterSpacing: -0.5,
          height: 1.4,
        ),
      ),

      // ========== BOTTOM NAVIGATION THEME ==========
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 8,
        height: 72,
        indicatorColor: const Color(0xFFEAF3FF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((state) {
          if (state.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4DA3FF),
              letterSpacing: 0.4,
              height: 1.3,
            );
          }
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5A6B7F),
            letterSpacing: 0.4,
            height: 1.3,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((state) {
          if (state.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: Color(0xFF4DA3FF),
              size: 24,
            );
          }
          return const IconThemeData(
            color: Color(0xFF5A6B7F),
            size: 24,
          );
        }),
      ),

      // ========== CARD THEME (Soft Blue-tinted) ==========
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFFFF),
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFF0F5FF), width: 1),
        ),
        shadowColor: const Color(0xFF4DA3FF).withOpacity(0.08),
      ),

      // ========== INPUT DECORATION THEME ==========
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFEEF4FF),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFD9E6F5), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFD9E6F5), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF4DA3FF), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFF06A6A), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFF06A6A), width: 2),
        ),
        labelStyle: const TextStyle(
          color: Color(0xFF5A6B7F),
          fontWeight: FontWeight.w600,
        ),
        hintStyle: TextStyle(
          color: colorScheme.onSurfaceVariant.withOpacity(0.6),
        ),
      ),

      // ========== ELEVATED BUTTON THEME ==========
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
            height: 1.43,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),

      // ========== OUTLINED BUTTON THEME ==========
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colorScheme.primary, width: 2),
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
            height: 1.43,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ========== TEXT BUTTON THEME ==========
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
            height: 1.43,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),

      // ========== CHIP THEME ==========
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceVariant,
        disabledColor: colorScheme.outlineVariant.withOpacity(0.3),
        selectedColor: colorScheme.primaryContainer,
        secondarySelectedColor: colorScheme.primaryContainer,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.33,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.33,
        ),
      ),

      // ========== TAB BAR THEME ==========
      tabBarTheme: TabBarThemeData(
        indicatorColor: colorScheme.primary,
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
          height: 1.4,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.4,
        ),
      ),

      // ========== FLOATING ACTION BUTTON THEME ==========
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        hoverElevation: 8,
        highlightElevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // ========== DIVIDER THEME ==========
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
        space: 16,
      ),

      // ========== DIALOG THEME ==========
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadowColor: colorScheme.shadow,
      ),

      // ========== SNACK BAR THEME ==========
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFFF1F1F6),
          letterSpacing: 0.25,
          height: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),

      // ========== TEXT THEME (Material 3 tuned) ==========
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.2,
          color: Color(0xFF1A1E2E),
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.25,
          height: 1.2,
          color: Color(0xFF1A1E2E),
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.3,
          color: Color(0xFF1A1E2E),
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          height: 1.3,
          color: Color(0xFF1A1E2E),
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.35,
          color: Color(0xFF1A1E2E),
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.4,
          color: Color(0xFF1A1E2E),
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
          height: 1.4,
          color: Color(0xFF1A1E2E),
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.4,
          color: Color(0xFF1A1E2E),
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          height: 1.4,
          color: Color(0xFF1A1E2E),
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.6,
          color: Color(0xFF1A1E2E),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.6,
          color: Color(0xFF6B7A8F),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.5,
          color: Color(0xFF6B7A8F),
        ),
        labelLarge: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
          height: 1.43,
          color: Color(0xFF1A1E2E),
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.33,
          color: Color(0xFF1A1E2E),
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.45,
          color: Color(0xFF1A1E2E),
        ),
      ),

      // ========== EXTENSIONS & UTILITIES ==========
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

/// Spacing constants
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
}

/// Border radius constants
class AppRadius {
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 28.0;
  static const double pill = 999.0;
}

/// Shadow factory - SOFT BLUE-TINTED (premium, airy)
class AppShadows {
  // Subtle base elevation (cards, surfaces)
  static BoxShadow base(ColorScheme colors) => const BoxShadow(
        color: Color(0xFF4DA3FF),
        blurRadius: 12,
        offset: Offset(0, 4),
        spreadRadius: 0,
      ).copyWith(color: const Color(0xFF4DA3FF).withOpacity(0.06));

  // Hover state elevation (interactive)
  static BoxShadow hover(ColorScheme colors) => const BoxShadow(
        color: Color(0xFF4DA3FF),
        blurRadius: 16,
        offset: Offset(0, 8),
        spreadRadius: 0,
      ).copyWith(color: const Color(0xFF4DA3FF).withOpacity(0.12));

  // Elevated state (cards on hover)
  static List<BoxShadow> elevated(ColorScheme colors) => [
        BoxShadow(
          color: const Color(0xFF4DA3FF).withOpacity(0.1),
          blurRadius: 14,
          offset: const Offset(0, 6),
          spreadRadius: 0,
        ),
      ];

  // Modal/Dialog backdrop shadow (premium feel)
  static List<BoxShadow> modal(ColorScheme colors) => [
        BoxShadow(
          color: const Color(0xFF4DA3FF).withOpacity(0.15),
          blurRadius: 40,
          offset: const Offset(0, 20),
          spreadRadius: 0,
        ),
      ];
}
