import 'package:flutter/material.dart';

/// Custom page route builder for smooth fade + slide transitions
class FadedSlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;

  FadedSlidePageRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 220),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 0.05);
      const end = Offset.zero;
      const curve = Curves.easeOutCubic;

      final offsetTween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      final fadeTween = Tween<double>(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: curve),
      );

      return FadeTransition(
        opacity: animation.drive(fadeTween),
        child: SlideTransition(
          position: animation.drive(offsetTween),
          child: child,
        ),
      );
    },
  );
}

/// Custom page route builder for smooth scale + fade dialog transitions
class ScaledFadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;

  ScaledFadePageRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 220),
  }) : super(
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeOutCubic;

      final scaleTween = Tween<double>(begin: 0.85, end: 1.0).chain(
        CurveTween(curve: curve),
      );

      final fadeTween = Tween<double>(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: curve),
      );

      return FadeTransition(
        opacity: animation.drive(fadeTween),
        child: ScaleTransition(
          scale: animation.drive(scaleTween),
          child: child,
        ),
      );
    },
  );
}

/// Extension method for easy navigation with custom transitions
extension SmoothNavigationExtension on BuildContext {
  Future<T?> pushWithFadeSlide<T>(Widget page) {
    return Navigator.push(this, FadedSlidePageRoute<T>(page: page));
  }

  Future<T?> pushWithScaleFade<T>(Widget page) {
    return Navigator.push(this, ScaledFadePageRoute<T>(page: page));
  }

  void popWithAnimation() {
    Navigator.pop(this);
  }
}
