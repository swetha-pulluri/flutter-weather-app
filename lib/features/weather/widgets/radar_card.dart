import 'package:flutter/material.dart';

class RadarCard extends StatelessWidget {
  const RadarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔥 TITLE
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Weather Radar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// 🔥 RADAR CARD
        Container(
          height: 220,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(28),

            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),

          child: Stack(
            alignment: Alignment.center,
            children: [
              /// 🌍 RADAR CIRCLES
              Container(
                width: 180,
                height: 180,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1),
                ),
              ),

              Container(
                width: 120,
                height: 120,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1),
                ),
              ),

              Container(
                width: 60,
                height: 60,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1),
                ),
              ),

              /// 📍 CENTER DOT
              Container(
                width: 14,
                height: 14,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),

              /// 🌧 SAMPLE WEATHER DOTS
              Positioned(
                top: 50,
                right: 80,
                child: Container(
                  width: 18,
                  height: 18,

                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                bottom: 60,
                left: 70,
                child: Container(
                  width: 22,
                  height: 22,

                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
