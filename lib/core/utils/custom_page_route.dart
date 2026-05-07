import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
    : super(
        transitionDuration: const Duration(milliseconds: 500),

        reverseTransitionDuration: const Duration(milliseconds: 400),

        pageBuilder: (context, animation, secondaryAnimation) => child,

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          /// 🌟 SLIDE ANIMATION
          const begin = Offset(0.15, 0);

          const end = Offset.zero;

          const curve = Curves.easeOutCubic;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          /// ✨ FADE
          final fadeAnimation = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation);

          return SlideTransition(
            position: animation.drive(tween),

            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
      );
}
