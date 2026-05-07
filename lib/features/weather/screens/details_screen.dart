import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF090B16),

      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text(
          "Weather Details",

          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          /// 📊 TITLE
          const Text(
            "Weather Analytics",

            style: TextStyle(
              color: Colors.white,

              fontSize: 28,

              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          /// 📦 GRID
          GridView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            itemCount: 4,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

              crossAxisSpacing: 16,

              mainAxisSpacing: 16,

              childAspectRatio: 1.1,
            ),

            itemBuilder: (context, index) {
              final data = [
                {
                  "title": "Feels Like",

                  "value": "${provider.feelsLike.toStringAsFixed(0)}°",

                  "icon": Icons.thermostat,
                },

                {
                  "title": "Visibility",

                  "value":
                      "${(provider.visibility / 1000).toStringAsFixed(1)} km",

                  "icon": Icons.visibility,
                },

                {
                  "title": "Pressure",

                  "value": "${provider.pressure} hPa",

                  "icon": Icons.speed,
                },

                {
                  "title": "Humidity",

                  "value": "${provider.humidity}%",

                  "icon": Icons.water_drop,
                },
              ];

              final item = data[index];

              return Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),

                  borderRadius: BorderRadius.circular(24),

                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Icon(
                      item["icon"] as IconData,

                      color: Colors.white,

                      size: 30,
                    ),

                    Text(
                      item["title"] as String,

                      style: const TextStyle(color: Colors.white60),
                    ),

                    Text(
                      item["value"] as String,

                      style: const TextStyle(
                        color: Colors.white,

                        fontSize: 22,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
