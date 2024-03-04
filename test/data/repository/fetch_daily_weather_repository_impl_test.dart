import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source.dart';
import 'package:flutter_weather_app/data/model/weather_daily_model.dart';
import 'package:flutter_weather_app/data/repository/fetch_daily_weather_repository_impl.dart';
import 'package:flutter_weather_app/domain/repository/fetch_daily_weather_repository.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mocks.dart';

void main() {
  late FetchDailyWeatherRepository repository;
  late FetchDailyWeatherDataSource dataSource;

  setUpAll(() {
    dataSource = MockFetchDailyWeatherDataSource();
    repository = FetchDailyWeatherRepositoryImpl(dataSource);
    registerFallbackValue(TemperatureUnit.celsius);
  });

  group("FetchDailyWeatherRepository Test", () {
    test("FetchDailyWeatherRepository calls and return success", () async {
      const result =
          Left<List<WeatherDailyModel>, BaseException>([mockWeatherModel]);
      when(() => dataSource.fetchDailyWeather(TemperatureUnit.celsius))
          .thenAnswer((_) => Future.value(result));

      final response =
          await repository.fetchDailyWeather(TemperatureUnit.celsius);

      verify(() => dataSource.fetchDailyWeather(any())).called(1);

      expect(response.isLeft(), true);
    });

    test("FetchDailyWeatherUseCase calls and return exception", () async {
      const result = Right<List<WeatherDailyModel>, BaseException>(
          NetworkException("error"));
      when(() => dataSource.fetchDailyWeather(TemperatureUnit.celsius))
          .thenAnswer((_) => Future.value(result));

      final response =
          await repository.fetchDailyWeather(TemperatureUnit.celsius);

      verify(() => dataSource.fetchDailyWeather(any())).called(1);

      expect(response, result);
    });
  });
}
