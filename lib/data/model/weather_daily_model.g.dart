// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDailyModel _$WeatherDailyModelFromJson(Map<String, dynamic> json) =>
    WeatherDailyModel(
      (json['dt'] as num).toDouble(),
      (json['humidity'] as num).toDouble(),
      (json['pressure'] as num).toDouble(),
      Temperature.fromJson(json['temp'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['wind_speed'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDailyModelToJson(WeatherDailyModel instance) =>
    <String, dynamic>{
      'dt': instance.dateTime,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'temp': instance.temperature.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => Temperature(
      (json['day'] as num).toDouble(),
      (json['min'] as num).toDouble(),
      (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'day': instance.temperature,
      'min': instance.minTemperature,
      'max': instance.maxTemperature,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['main'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': instance.name,
      'icon': instance.icon,
    };
