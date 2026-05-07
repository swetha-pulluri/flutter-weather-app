import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherOverlay extends StatelessWidget {
  final String condition;

  const WeatherOverlay({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    /// ☁ CLOUDS
    if (condition.toLowerCase() == "clouds") {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),

        child: Container(color: Colors.white.withOpacity(0.03)),
      );
    }

    /// 🌧 RAIN
    if (condition.toLowerCase() == "rain") {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.10), Colors.transparent],

            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,
          ),
        ),
      );
    }

    /// ☀ CLEAR
    if (condition.toLowerCase() == "clear") {
      return Align(
        alignment: Alignment.topRight,

        child: Container(
          margin: const EdgeInsets.all(30),

          width: 220,

          height: 220,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            gradient: RadialGradient(
              colors: [
                Colors.yellow.withOpacity(0.35),

                Colors.orange.withOpacity(0.12),

                Colors.transparent,
              ],
            ),
          ),
        ),
      );
    }

    return const SizedBox();
  }
}
