import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';

class WeatherInsightCard extends StatelessWidget {
  const WeatherInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    String title = "";
    String message = "";
    String emoji = "";

    Color startColor = Colors.indigo;
    Color endColor = Colors.deepPurple;

    /// ☀ HOT WEATHER
    if (provider.temperature >= 35) {
      title = "Heat Alert";

      emoji = "🔥";

      message =
          "High temperatures today. Stay hydrated and avoid long outdoor exposure.";

      startColor = Colors.orange;
      endColor = Colors.redAccent;
    }
    /// 🌧 RAIN
    else if (provider.condition.toLowerCase() == "rain") {
      title = "Rainy Mood";

      emoji = "☔";

      message = "Perfect weather for coffee, coding, and relaxing indoors.";

      startColor = Colors.blue;
      endColor = Colors.indigo;
    }
    /// ☁ CLOUDY
    else if (provider.condition.toLowerCase() == "clouds") {
      title = "Cloudy Skies";

      emoji = "☁";

      message =
          "Cloud cover may keep temperatures pleasant throughout the day.";

      startColor = Colors.blueGrey;
      endColor = Colors.grey;
    }
    /// 🌫 HAZE / FOG
    else if (provider.condition.toLowerCase() == "haze" ||
        provider.condition.toLowerCase() == "mist" ||
        provider.condition.toLowerCase() == "fog") {
      title = "Low Visibility";

      emoji = "🌫";

      message = "Visibility may be reduced outdoors. Travel carefully.";

      startColor = Colors.grey;
      endColor = Colors.blueGrey;
    }
    /// 🌬 WINDY
    else if (provider.windSpeed >= 20) {
      title = "Wind Advisory";

      emoji = "🌬";

      message =
          "Strong winds detected today. Outdoor conditions may feel cooler.";

      startColor = Colors.teal;
      endColor = Colors.cyan;
    }
    /// 🌤 PERFECT WEATHER
    else {
      title = "Pleasant Weather";

      emoji = "🌤";

      message = "Great weather for outdoor activities and evening walks.";

      startColor = Colors.indigo;
      endColor = Colors.purpleAccent;
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
            color: startColor.withOpacity(0.35),

            blurRadius: 20,

            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 30)),

              const SizedBox(width: 12),

              Text(
                title,

                style: const TextStyle(
                  color: Colors.white,

                  fontSize: 22,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            message,

            style: const TextStyle(
              color: Colors.white,

              fontSize: 16,

              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
