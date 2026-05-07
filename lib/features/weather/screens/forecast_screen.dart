import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

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

    final forecast = provider.forecastList;

    return Scaffold(
      backgroundColor: const Color(0xFF090B16),

      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,

        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text(
          "5-Day Forecast",

          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: forecast.length > 15 ? 15 : forecast.length,

        itemBuilder: (context, index) {
          final item = forecast[index];

          final condition = item['weather'][0]['main'];

          final temp = (item['main']['temp']).toDouble();

          final dateTime = DateTime.parse(item['dt_txt']);

          final day = DateFormat('EEEE').format(dateTime);

          final time = DateFormat.jm().format(dateTime);

          return Container(
            margin: const EdgeInsets.only(bottom: 16),

            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),

              borderRadius: BorderRadius.circular(24),

              border: Border.all(color: Colors.white12),
            ),

            child: Row(
              children: [
                /// 🌤 ICON
                Icon(getWeatherIcon(condition), color: Colors.white, size: 38),

                const SizedBox(width: 20),

                /// 📅 DAY + TIME
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        day,

                        style: const TextStyle(
                          color: Colors.white,

                          fontSize: 18,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(time, style: const TextStyle(color: Colors.white60)),
                    ],
                  ),
                ),

                /// 🌡 TEMP
                Text(
                  "${temp.toStringAsFixed(0)}°",

                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 26,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
