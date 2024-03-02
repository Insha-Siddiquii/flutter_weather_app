import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/utils/weather.dart';
import 'package:flutter_weather_app/presentation/utils/weather_image.dart';

class WeatherDaysSlider extends StatelessWidget {
  const WeatherDaysSlider(
      {super.key, required this.weather, required this.onPressed});

  final Weather weather;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onPressed,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 180,
              ),
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Fri",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Image.asset(
                          weather.imagePath,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        const Text(
                          "12°/2°",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
