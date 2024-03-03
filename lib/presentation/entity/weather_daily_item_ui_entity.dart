import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:intl/intl.dart';

class WeatherDailyItemUiEntity extends Equatable {
  final String temperature;
  final String minTemperature;
  final String maxTemperature;
  final String humidity;
  final String pressure;
  final String windSpeed;
  final String fullDayName;
  final String shortDayName;
  final String weatherName;
  final String imageUrl;
  final TemperatureUnit temperatureUnit;

  const WeatherDailyItemUiEntity({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.fullDayName,
    required this.shortDayName,
    required this.weatherName,
    required this.imageUrl,
    required this.temperatureUnit,
  });

  factory WeatherDailyItemUiEntity.copyFrom(
    WeatherDailyItemEntity weatherDailyItemEntity,
  ) {
    return WeatherDailyItemUiEntity(
      temperature: weatherDailyItemEntity.temperature.toString(),
      minTemperature: weatherDailyItemEntity.minTemperature.toString(),
      maxTemperature: weatherDailyItemEntity.maxTemperature.toString(),
      humidity: "${weatherDailyItemEntity.humidity}%",
      pressure: "${weatherDailyItemEntity.pressure} hpa",
      windSpeed: getWindSpeedWithUnit(weatherDailyItemEntity.temperatureUnit,
          weatherDailyItemEntity.windSpeed),
      fullDayName: getDayName(weatherDailyItemEntity.dailyTime),
      shortDayName: getShortDayName(weatherDailyItemEntity.dailyTime),
      weatherName: weatherDailyItemEntity.name,
      imageUrl: getWeatherImageUrl(weatherDailyItemEntity.imageIcon),
      temperatureUnit: weatherDailyItemEntity.temperatureUnit,
    );
  }

  static String getDayName(double unixUtcTimestamp) {
    DateTime dateTime = convertIntoDateTime(unixUtcTimestamp);
    return DateFormat('EEEE').format(dateTime);
  }

  static String getShortDayName(double unixUtcTimestamp) {
    DateTime dateTime = convertIntoDateTime(unixUtcTimestamp);
    return DateFormat('E').format(dateTime);
  }

  static DateTime convertIntoDateTime(double unixUtcTimestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(
        (unixUtcTimestamp.toInt()) * 1000000);
  }

  static String getWeatherImageUrl(String imageIcon) {
    return "https://openweathermap.org/img/wn/$imageIcon@2x.png";
  }

  static String getWindSpeedWithUnit(
      TemperatureUnit temperatureUnit, double windSpeed) {
    if (temperatureUnit == TemperatureUnit.celsius) {
      return "${mphToKph(windSpeed)} km/h";
    } else {
      return "${mpsToKph(windSpeed)} km/h";
    }
  }

  static double mphToKph(double mph) {
    return mph * 1.60934; // 1 mile per hour = 1.60934 kilometers per hour
  }

  static double mpsToKph(double mps) {
    return mps * 3.6; // 1 meter per second = 3.6 kilometers per hour
  }

  @override
  List<Object?> get props => [
        temperature,
        minTemperature,
        maxTemperature,
        humidity,
        pressure,
        windSpeed,
        fullDayName,
        shortDayName,
        imageUrl,
        temperatureUnit,
        weatherName,
      ];
}
