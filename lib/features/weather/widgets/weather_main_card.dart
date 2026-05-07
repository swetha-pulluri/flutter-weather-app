import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather/provider/weather_provider.dart';
import 'package:intl/intl.dart';

class WeatherMainCard extends StatelessWidget {
  const WeatherMainCard({super.key});
  IconData getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case "clear":
        return Icons.wb_sunny;

      case "clouds":
        return Icons.cloud;

      case "rain":
        return Icons.grain;

      case "thunderstorm":
        return Icons.flash_on;

      case "snow":
        return Icons.ac_unit;

      case "mist":
      case "haze":
      case "fog":
        return Icons.blur_on;

      default:
        return Icons.cloud_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    return Column(
      children: [
        /// 🌤 WEATHER ICON
        Icon(
          getWeatherIcon(provider.condition),

          color: Colors.white70,

          size: 120,
        ),

        /// 🌍 CITY
        Text(
          context.watch<WeatherProvider>().city,

          style: const TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        /// 📅 DATE
        /// 📅 DATE & TIME
        Text(
          DateFormat('EEEE, d MMMM • hh:mm a').format(DateTime.now()),

          style: const TextStyle(color: Colors.white60, fontSize: 18),
        ),

        const SizedBox(height: 30),

        /// 🌡 TEMPERATURE
        Text(
          "${context.watch<WeatherProvider>().temperature.toStringAsFixed(0)}°",

          style: const TextStyle(
            color: Colors.white,
            fontSize: 110,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 10),

        /// ☁ CONDITION
        Text(
          provider.condition,

          style: const TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ],
    );
  }
}
