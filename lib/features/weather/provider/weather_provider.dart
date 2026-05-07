import 'package:flutter/material.dart';
import 'package:weather_app/data/services/api_service.dart';

class WeatherProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  /// 🌍 WEATHER DATA
  String city = "London";

  double temperature = 24;

  String condition = "provider.condition";

  int humidity = 68;

  double windSpeed = 12;

  int pressure = 1012;
  double feelsLike = 0;

  int visibility = 0;

  int sunrise = 0;

  int sunset = 0;

  int uvIndex = 3;

  /// ⏰ FORECAST DATA
  List<dynamic> forecastList = [];

  /// 🔥 LOADING
  bool isLoading = false;

  /// ❌ ERROR
  String errorMessage = "";

  /// 🌍 GET CURRENT WEATHER
  Future<void> getWeather(String cityName) async {
    try {
      isLoading = true;

      errorMessage = "";

      notifyListeners();

      final data = await _apiService.fetchWeather(cityName);

      city = data['name'];

      temperature = (data['main']['temp']).toDouble();

      condition = data['weather'][0]['main'];
      debugPrint(condition);

      humidity = data['main']['humidity'];

      windSpeed = (data['wind']['speed']).toDouble();

      pressure = data['main']['pressure'];
      feelsLike = (data['main']['feels_like']).toDouble();

      visibility = data['visibility'];

      sunrise = data['sys']['sunrise'];

      sunset = data['sys']['sunset'];

      /// 🔥 FETCH FORECAST
      await getForecast(cityName);

      isLoading = false;

      notifyListeners();
    } catch (e) {
      isLoading = false;

      errorMessage = "City not found";

      notifyListeners();
    }
  }

  /// ⏰ GET FORECAST
  Future<void> getForecast(String cityName) async {
    try {
      final data = await _apiService.fetchForecast(cityName);

      forecastList = data;

      notifyListeners();
    } catch (e) {
      debugPrint("Forecast Error: $e");
    }
  }
}
