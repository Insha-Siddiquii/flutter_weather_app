import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source.dart';
import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/domain/repository/fetch_daily_weather_repository.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class FetchDailyWeatherRepositoryImpl implements FetchDailyWeatherRepository {
  final FetchDailyWeatherDataSource _dailyWeatherDataSource;

  FetchDailyWeatherRepositoryImpl(this._dailyWeatherDataSource);
  @override
  Future<Either<List<WeatherDailyItemEntity>, BaseException>> fetchDailyWeather(
    TemperatureUnit unit,
  ) async {
    final response = await _dailyWeatherDataSource.fetchDailyWeather(unit);
    return response.bimap(
        (data) => data.map((item) {
              final dailyData = item;
              final dailyWeather = item.weather.first;
              return WeatherDailyItemEntity(
                temperature: dailyData.temperature.temperature,
                minTemperature: dailyData.temperature.minTemperature,
                maxTemperature: dailyData.temperature.maxTemperature,
                humidity: dailyData.humidity,
                pressure: dailyData.pressure,
                windSpeed: dailyData.windSpeed,
                name: dailyWeather.name,
                imageIcon: dailyWeather.icon,
                dailyTime: dailyData.dateTime,
                temperatureUnit: unit,
              );
            }).toList(),
        (exception) => exception);
  }
}
