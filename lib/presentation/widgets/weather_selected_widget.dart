import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class WeatherSelectedWidget extends StatelessWidget {
  const WeatherSelectedWidget({
    required this.weather,
    required this.onTemperatureUnitTap,
    super.key,
  });

  final WeatherDailyItemUiEntity weather;
  final void Function(TemperatureUnit unit) onTemperatureUnitTap;

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
                child: Text(
                  weather.fullDayName,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                onTemperatureUnitTap(
                  weather.temperatureUnit == TemperatureUnit.celsius
                      ? TemperatureUnit.fahrenheit
                      : TemperatureUnit.celsius,
                );
              },
              child: Text(
                weather.temperatureUnit.value,
                style: const TextStyle(
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
        Text(
          weather.weatherName,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(
          height: 16.0,
        ),

        /// Weather Image
        Center(
          child: Image.network(
            weather.imageUrl,
            width: 200,
            height: 200,
          ),
        ),

        const SizedBox(
          height: 10.0,
        ),

        /// Temperature
        Center(
          child: Text(
            "${weather.temperature}°",
            style: const TextStyle(
              fontSize: 56.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        const SizedBox(
          height: 10.0,
        ),

        /// Weather Details
        Text(
          "Humidity: ${weather.humidity}",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(
          height: 4.0,
        ),

        Text(
          "Pressure: ${weather.pressure}",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(
          height: 4.0,
        ),

        Text(
          "Wind: ${weather.windSpeed}",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
