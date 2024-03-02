import 'package:flutter_weather_app/presentation/utils/weather.dart';

extension WeatherImage on Weather {
  String get imagePath {
    switch (this) {
      case Weather.sunny:
        return 'assets/sun.jpeg';
      case Weather.cloudy:
        return 'assets/sun_cloud.jpeg';
      case Weather.rainy:
        return 'assets/rain.jpeg';
      case Weather.snowy:
        return 'assets/snow.jpeg';
      default:
        return 'assets/default.jpeg';
    }
  }
}
