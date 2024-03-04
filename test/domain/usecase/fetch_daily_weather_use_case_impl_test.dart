import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/domain/repository/fetch_daily_weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case_impl.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mocks.dart';

void main() {
  late FetchDailyWeatherRepository repository;
  late FetchDailyWeatherUseCase useCase;

  setUpAll(() {
    repository = MockFetchDailyWeatherRepository();
    useCase = FetchDailyWeatherUseCaseImpl(repository);
    registerFallbackValue(TemperatureUnit.celsius);
  });

  group("FetchDailyWeatherUseCase Test", () {
    test("FetchDailyWeatherUseCase calls and return success", () async {
      const result = Left<List<WeatherDailyItemEntity>, BaseException>(
          [mockWeatherEntity]);
      when(() => repository.fetchDailyWeather(TemperatureUnit.celsius))
          .thenAnswer((_) => Future.value(result));

      final response = await useCase.call(TemperatureUnit.celsius);

      verify(() => repository.fetchDailyWeather(any())).called(1);

      expect(response, result);
    });

    test("FetchDailyWeatherUseCase calls and return exception", () async {
      const result = Right<List<WeatherDailyItemEntity>, BaseException>(
          NetworkException("error"));
      when(() => repository.fetchDailyWeather(TemperatureUnit.celsius))
          .thenAnswer((_) => Future.value(result));

      final response = await useCase.call(TemperatureUnit.celsius);

      verify(() => repository.fetchDailyWeather(any())).called(1);

      expect(response, result);
    });
  });
}
