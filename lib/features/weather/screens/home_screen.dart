import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/features/weather/provider/weather_provider.dart';
import 'package:weather_app/features/weather/screens/details_screen.dart';

import 'package:weather_app/features/weather/widgets/header_section.dart';
import 'package:weather_app/features/weather/widgets/weather_main_card.dart';
import 'package:weather_app/features/weather/widgets/forecast_row.dart';
import 'package:weather_app/features/weather/widgets/info_grid.dart';
import 'package:weather_app/features/weather/widgets/radar_card.dart';
import 'package:weather_app/features/weather/widgets/bottom_nav.dart';
import 'package:weather_app/features/weather/widgets/advisory_card.dart';
import 'package:weather_app/core/utils/weather_background.dart';
import 'package:weather_app/features/weather/widgets/weather_overlay.dart';
import 'package:weather_app/features/weather/widgets/sunrise_sunset_card.dart';
import 'package:weather_app/features/weather/widgets/weather_insight_card.dart';
import 'package:weather_app/core/utils/custom_page_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      body: Stack(
        children: [
          /// 🌤 DYNAMIC BACKGROUND
          Container(
            decoration: BoxDecoration(
              gradient: WeatherBackground.getGradient(provider.condition),
            ),
          ),

          /// 🌧 WEATHER OVERLAY
          WeatherOverlay(condition: provider.condition),

          /// 📱 MAIN UI
          SafeArea(
            child: Column(
              children: [
                /// 🔥 CONTENT
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),

                    children: const [
                      HeaderSection(),

                      SizedBox(height: 30),

                      WeatherMainCard(),

                      SizedBox(height: 30),

                      ForecastRow(),

                      SizedBox(height: 30),

                      InfoGrid(),

                      SizedBox(height: 30),

                      RadarCard(),

                      SizedBox(height: 20),

                      AdvisoryCard(),
                      SunriseSunsetCard(),
                      WeatherInsightCard(),
                    ],
                  ),
                ),

                /// 🔥 DETAILS BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,

                          CustomPageRoute(child: const DetailsScreen()),
                        );
                      },

                      child: const Text("View Details"),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// 🔥 BOTTOM NAV
                const BottomNav(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
