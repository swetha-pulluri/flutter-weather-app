import 'package:flutter/material.dart';

class WeatherBackground {
  static LinearGradient getGradient(String condition) {
    switch (condition.toLowerCase()) {
      /// ☀ CLEAR
      case "clear":
        return const LinearGradient(
          colors: [Color(0xFF1E3C72), Color(0xFF2A5298), Color(0xFF6DD5FA)],

          begin: Alignment.topLeft,

          end: Alignment.bottomRight,
        );

      /// ☁ CLOUDS
      case "clouds":
        return const LinearGradient(
          colors: [Color(0xFF232526), Color(0xFF414345), Color(0xFF606c88)],

          begin: Alignment.topCenter,

          end: Alignment.bottomCenter,
        );

      /// 🌧 RAIN
      case "rain":
        return const LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],

          begin: Alignment.topLeft,

          end: Alignment.bottomRight,
        );

      /// ⛈ THUNDERSTORM
      case "thunderstorm":
        return const LinearGradient(
          colors: [Color(0xFF000000), Color(0xFF434343), Color(0xFF1F1C2C)],

          begin: Alignment.topCenter,

          end: Alignment.bottomCenter,
        );

      /// ❄ SNOW
      case "snow":
        return const LinearGradient(
          colors: [Color(0xFFE6DADA), Color(0xFF274046)],

          begin: Alignment.topLeft,

          end: Alignment.bottomRight,
        );

      /// 🌫 HAZE / MIST / FOG
      case "mist":
      case "fog":
      case "haze":
        return const LinearGradient(
          colors: [Color(0xFF3E5151), Color(0xFFDECBA4)],

          begin: Alignment.topCenter,

          end: Alignment.bottomCenter,
        );

      default:
        return const LinearGradient(
          colors: [Color(0xFF090B16), Color(0xFF11162A)],

          begin: Alignment.topLeft,

          end: Alignment.bottomRight,
        );
    }
  }
}
