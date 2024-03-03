import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/domain/repository/fetch_daily_weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class FetchDailyWeatherUseCaseImpl extends FetchDailyWeatherUseCase {
  final FetchDailyWeatherRepository _fetchDailyWeatherRepository;

  FetchDailyWeatherUseCaseImpl(this._fetchDailyWeatherRepository);
  @override
  Future<Either<List<WeatherDailyItemEntity>, BaseException>> call(
    TemperatureUnit unit,
  ) {
    return _fetchDailyWeatherRepository.fetchDailyWeather(unit);
  }
}
