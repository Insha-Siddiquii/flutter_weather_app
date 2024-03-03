import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

abstract class FetchDailyWeatherUseCase {
  Future<Either<List<WeatherDailyItemEntity>, BaseException>> call(
    TemperatureUnit unit,
  );
}
