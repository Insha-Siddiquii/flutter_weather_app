import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/utils/weather.dart';
import 'package:flutter_weather_app/presentation/widgets/weather_content.dart';

class WeatherMainScreen extends StatelessWidget {
  const WeatherMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Weather weather = Weather.rainy;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 24.0,
          ),
          child: WeatherContent(
            weather: weather,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
