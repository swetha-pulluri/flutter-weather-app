import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';
import 'package:intl/intl.dart';

class ForecastRow extends StatelessWidget {
  const ForecastRow({super.key});

  IconData getIcon(String condition) {
    switch (condition.toLowerCase()) {
      case "clear":
        return Icons.wb_sunny;

      case "clouds":
        return Icons.cloud;

      case "rain":
        return Icons.grain;

      default:
        return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    final forecast = provider.forecastList;

    if (forecast.isEmpty) {
      return const SizedBox();
    }

    return SizedBox(
      height: 130,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: forecast.length > 8 ? 8 : forecast.length,

        itemBuilder: (context, index) {
          final item = forecast[index];

          final temp = (item['main']['temp']).toDouble();

          final condition = item['weather'][0]['main'];

          final rawTime = item['dt_txt'];

          final dateTime = DateTime.parse(rawTime);

          final time = DateFormat.jm().format(dateTime);

          return Container(
            width: 90,

            margin: const EdgeInsets.symmetric(horizontal: 8),

            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),

              borderRadius: BorderRadius.circular(22),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text(time, style: const TextStyle(color: Colors.white)),

                Icon(getIcon(condition), color: Colors.white),

                Text(
                  "${temp.toStringAsFixed(0)}°",

                  style: const TextStyle(
                    color: Colors.white,

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
