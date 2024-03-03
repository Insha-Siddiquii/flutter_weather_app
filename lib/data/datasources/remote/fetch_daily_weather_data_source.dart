import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/data/model/weather_daily_model.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

abstract class FetchDailyWeatherDataSource {
  Future<Either<List<WeatherDailyModel>, BaseException>> fetchDailyWeather(
    TemperatureUnit unit,
  );
}
