import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_daily_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherDailyModel extends Equatable {
  @JsonKey(name: 'dt')
  final double dateTime;
  @JsonKey(name: 'pressure')
  final double pressure;
  @JsonKey(name: 'humidity')
  final double humidity;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'temp')
  final Temperature temperature;
  @JsonKey(name: 'weather')
  final List<Weather> weather;

  const WeatherDailyModel(
    this.dateTime,
    this.humidity,
    this.pressure,
    this.temperature,
    this.weather,
    this.windSpeed,
  );

  @override
  List<Object?> get props => [
        dateTime,
        pressure,
        humidity,
        windSpeed,
        temperature,
        weather,
      ];

  factory WeatherDailyModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDailyModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Temperature extends Equatable {
  @JsonKey(name: 'day')
  final double temperature;
  @JsonKey(name: 'min')
  final double minTemperature;
  @JsonKey(name: 'max')
  final double maxTemperature;

  const Temperature(
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
  );

  @override
  List<Object?> get props => [
        temperature,
        minTemperature,
        maxTemperature,
      ];

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Weather extends Equatable {
  @JsonKey(name: 'main')
  final String name;
  @JsonKey(name: 'icon')
  final String icon;

  const Weather(
    this.name,
    this.icon,
  );

  @override
  List<Object?> get props => [
        name,
        icon,
      ];

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
