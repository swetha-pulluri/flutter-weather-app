import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isCelsius = true;

  bool animationsEnabled = true;

  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090B16),

      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,

        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text("Settings", style: TextStyle(color: Colors.white)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          /// 🌡 TEMPERATURE UNIT
          buildSettingsCard(
            title: "Temperature Unit",

            subtitle: isCelsius
                ? "Currently using Celsius"
                : "Currently using Fahrenheit",

            trailing: Switch(
              value: isCelsius,

              activeColor: Colors.blue,

              onChanged: (value) {
                setState(() {
                  isCelsius = value;
                });
              },
            ),
          ),

          const SizedBox(height: 18),

          /// 🎞 ANIMATIONS
          buildSettingsCard(
            title: "Animations",

            subtitle: animationsEnabled
                ? "Animations enabled"
                : "Animations disabled",

            trailing: Switch(
              value: animationsEnabled,

              activeColor: Colors.purple,

              onChanged: (value) {
                setState(() {
                  animationsEnabled = value;
                });
              },
            ),
          ),

          const SizedBox(height: 18),

          /// 🌙 DARK MODE
          buildSettingsCard(
            title: "Dark Mode",

            subtitle: darkMode ? "Dark theme active" : "Light theme active",

            trailing: Switch(
              value: darkMode,

              activeColor: Colors.orange,

              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          const SizedBox(height: 30),

          /// ℹ ABOUT
          Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),

              borderRadius: BorderRadius.circular(24),

              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "About",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 22,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 14),

                Text(
                  "Weather App v1.0",

                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                SizedBox(height: 8),

                Text(
                  "Built with Flutter & OpenWeather API",

                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettingsCard({
    required String title,

    required String subtitle,

    required Widget trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),

        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  color: Colors.white,

                  fontSize: 18,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(subtitle, style: const TextStyle(color: Colors.white60)),
            ],
          ),

          trailing,
        ],
      ),
    );
  }
}
