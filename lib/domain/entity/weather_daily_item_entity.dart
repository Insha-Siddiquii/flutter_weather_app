import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class WeatherDailyItemEntity extends Equatable {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final String name;
  final String imageIcon;
  final double dailyTime;
  final TemperatureUnit temperatureUnit;

  const WeatherDailyItemEntity({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.name,
    required this.imageIcon,
    required this.dailyTime,
    required this.temperatureUnit,
  });

  @override
  List<Object?> get props => [
        temperature,
        minTemperature,
        maxTemperature,
        humidity,
        pressure,
        windSpeed,
        name,
        imageIcon,
        dailyTime,
        temperatureUnit,
      ];
}
