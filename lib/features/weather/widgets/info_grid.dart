import 'package:flutter/material.dart';

class InfoGrid extends StatelessWidget {
  const InfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final info = [
      {"title": "Humidity", "value": "68%", "icon": Icons.water_drop},
      {"title": "Wind", "value": "12 km/h", "icon": Icons.air},
      {"title": "Pressure", "value": "1012 hPa", "icon": Icons.speed},
      {"title": "UV Index", "value": "3 Moderate", "icon": Icons.wb_sunny},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔥 TITLE
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Weather Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// 🔥 GRID
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: info.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),

          itemBuilder: (context, index) {
            final item = info[index];

            return Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(24),

                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔥 ICON
                  Icon(item["icon"] as IconData, color: Colors.white, size: 30),

                  /// 🔥 TITLE
                  Text(
                    item["title"] as String,
                    style: const TextStyle(color: Colors.white60, fontSize: 16),
                  ),

                  /// 🔥 VALUE
                  Text(
                    item["value"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
