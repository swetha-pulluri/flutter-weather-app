import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';

class AdvisoryCard extends StatelessWidget {
  const AdvisoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    String message = "";

    IconData icon = Icons.info;

    Color startColor = Colors.blue;

    Color endColor = Colors.blueAccent;

    /// 🔥 HOT
    if (provider.temperature >= 35) {
      message = "High temperature — Stay hydrated";

      icon = Icons.local_fire_department;

      startColor = Colors.orange;

      endColor = Colors.redAccent;
    }
    /// ☀ UV
    else if (provider.uvIndex >= 3) {
      message = "Moderate UV (${provider.uvIndex}) — Use SPF 30+ sunscreen";

      icon = Icons.wb_sunny;

      startColor = Colors.deepPurple;

      endColor = Colors.purpleAccent;
    }
    /// 🌧 RAIN
    else if (provider.condition.toLowerCase() == "rain") {
      message = "Rain expected — Carry umbrella";

      icon = Icons.grain;

      startColor = Colors.blue;

      endColor = Colors.lightBlueAccent;
    }
    /// 🌫 FOG
    else if (provider.condition.toLowerCase() == "mist") {
      message = "Low visibility — Drive carefully";

      icon = Icons.blur_on;

      startColor = Colors.grey;

      endColor = Colors.blueGrey;
    }
    /// 🌬 WIND
    else if (provider.windSpeed >= 20) {
      message = "Strong winds outside today";

      icon = Icons.air;

      startColor = Colors.teal;

      endColor = Colors.cyan;
    }
    /// 🌤 DEFAULT
    else {
      message = "Weather looks pleasant today";

      icon = Icons.wb_cloudy;

      startColor = Colors.indigo;

      endColor = Colors.deepPurple;
    }

    return Container(
      margin: const EdgeInsets.all(16),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],

          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: startColor.withOpacity(0.4),

            blurRadius: 20,

            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),

              shape: BoxShape.circle,
            ),

            child: Icon(icon, color: Colors.white, size: 34),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              message,

              style: const TextStyle(
                color: Colors.white,

                fontSize: 17,

                fontWeight: FontWeight.bold,

                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
