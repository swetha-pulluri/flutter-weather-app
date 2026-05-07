import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          /// ☰ MENU
          Icon(Icons.menu, color: Colors.white, size: 28),

          /// 🌤 TITLE
          Text(
            "Atmosphere",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          /// 📍 LOCATION
          Icon(Icons.location_on_outlined, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}
