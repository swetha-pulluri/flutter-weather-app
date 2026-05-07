import 'package:flutter/material.dart';

import 'package:weather_app/features/weather/screens/forecast_screen.dart';
import 'package:weather_app/core/utils/custom_page_route.dart';
import 'package:weather_app/features/weather/screens/search_screen.dart';
import 'package:weather_app/features/weather/screens/settings_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  Widget buildNavItem({
    required IconData icon,
    required int index,
    VoidCallback? onTap,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });

        if (onTap != null) {
          onTap();
        }
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.12) : Colors.transparent,

          borderRadius: BorderRadius.circular(20),
        ),

        child: Icon(
          icon,

          color: isActive ? Colors.white : Colors.white54,

          size: isActive ? 30 : 26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),

        borderRadius: BorderRadius.circular(30),

        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          /// 🏠 HOME
          buildNavItem(icon: Icons.home_rounded, index: 0),

          /// 🔍 SEARCH
          buildNavItem(
            icon: Icons.search_rounded,

            index: 1,

            onTap: () {
              Navigator.push(
                context,

                CustomPageRoute(child: const SearchScreen()),
              );
            },
          ),

          /// 📅 FORECAST
          buildNavItem(
            icon: Icons.calendar_today,

            index: 2,

            onTap: () {
              Navigator.push(
                context,

                CustomPageRoute(child: const ForecastScreen()),
              );
            },
          ),

          /// ⚙ SETTINGS
          buildNavItem(
            icon: Icons.settings_rounded,

            index: 3,

            onTap: () {
              Navigator.push(
                context,

                CustomPageRoute(child: const SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
