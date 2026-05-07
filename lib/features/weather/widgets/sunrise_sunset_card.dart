import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';

class SunriseSunsetCard extends StatelessWidget {
  const SunriseSunsetCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    /// 🌅 CONVERT UNIX TIME
    final sunrise = DateTime.fromMillisecondsSinceEpoch(
      provider.sunrise * 1000,
    );

    final sunset = DateTime.fromMillisecondsSinceEpoch(provider.sunset * 1000);

    /// ⏱ TOTAL DAY DURATION
    final totalDaySeconds = sunset.difference(sunrise).inSeconds;

    /// ⏱ CURRENT PROGRESS
    final now = DateTime.now();

    double progress = 0;

    if (now.isAfter(sunrise) && now.isBefore(sunset)) {
      progress = now.difference(sunrise).inSeconds / totalDaySeconds;
    }

    return Container(
      margin: const EdgeInsets.all(16),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),

        borderRadius: BorderRadius.circular(28),

        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Sunrise & Sunset",

            style: TextStyle(
              color: Colors.white,

              fontSize: 20,

              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          /// 🌅 TIMES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Row(
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.orange),

                      SizedBox(width: 8),

                      Text("Sunrise", style: TextStyle(color: Colors.white70)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    DateFormat.jm().format(sunrise),

                    style: const TextStyle(
                      color: Colors.white,

                      fontSize: 22,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Icon(Icons.nightlight_round, color: Colors.blue),

                      SizedBox(width: 8),

                      Text("Sunset", style: TextStyle(color: Colors.white70)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    DateFormat.jm().format(sunset),

                    style: const TextStyle(
                      color: Colors.white,

                      fontSize: 22,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 28),

          /// 📈 PROGRESS BAR
          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: progress,

              minHeight: 10,

              backgroundColor: Colors.white12,

              valueColor: const AlwaysStoppedAnimation(Colors.orange),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "${(progress * 100).toStringAsFixed(0)}% of daylight completed",

            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
