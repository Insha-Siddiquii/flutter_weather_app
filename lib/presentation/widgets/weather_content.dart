import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/utils/weather.dart';
import 'package:flutter_weather_app/presentation/utils/weather_image.dart';
import 'package:flutter_weather_app/presentation/widgets/weather_days_slider.dart';

class WeatherContent extends StatelessWidget {
  const WeatherContent({
    super.key,
    required this.weather,
    required this.onPressed,
  });

  final Weather weather;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Weather Day Title & Temperature Converter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Friday",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                "C/F",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),

        /// Weather Title
        const Text(
          "Showers",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(
          height: 16.0,
        ),

        /// Weather Image
        Image.asset(weather.imagePath),

        const SizedBox(
          height: 10.0,
        ),

        /// Temperature
        const Center(
          child: Text(
            "20°",
            style: TextStyle(
              fontSize: 56.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(
          height: 10.0,
        ),

        /// Weather Details
        const Text(
          "Humidity: 67%",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(
          height: 4.0,
        ),

        const Text(
          "Pressure: 1009 hPa",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(
          height: 4.0,
        ),

        const Text(
          "Wind: 23 km/h",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(
          height: 30.0,
        ),

        /// Weather Days Slider
        WeatherDaysSlider(weather: weather, onPressed: () {})
      ],
    );
  }
}
