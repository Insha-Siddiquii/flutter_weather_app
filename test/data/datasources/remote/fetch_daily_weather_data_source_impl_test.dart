import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/common/network/network_service_impl.dart';
import 'package:flutter_weather_app/data/converter/temperature_unit_converter.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source_impl.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mocks.dart';

void main() {
  late FetchDailyWeatherDataSource dataSource;
  late TemperatureValueConverter converter;
  late NetworkService networkService;

  setUpAll(() {
    converter = MockTemperatureValueConverter();
    networkService = MockNetworkService();
    dataSource = FetchDailyWeatherDataSourceImpl(networkService, converter);
    registerFallbackValue(TemperatureUnit.celsius);
  });

  group("FetchDailyWeatherDataSource Test", () {
    test("FetchDailyWeatherDataSource calls and return success", () async {
      const apiResponse =
          Left<Map<String, dynamic>, BaseException>(weatherResponse);

      when(() => converter.getTemperatureUnitValue(TemperatureUnit.celsius))
          .thenReturn("metric");
      when(() => networkService.executeRequest(any())).thenAnswer((_) async {
        return apiResponse;
      });

      final response =
          await dataSource.fetchDailyWeather(TemperatureUnit.celsius);

      verify(() => networkService.executeRequest(any())).called(1);

      expect(response.isLeft(), true);
    });

    test("FetchDailyWeatherDataSource calls and return exception", () async {
      const apiResponse =
          Right<Map<String, dynamic>, BaseException>(NetworkException("error"));
      when(() => converter.getTemperatureUnitValue(TemperatureUnit.celsius))
          .thenReturn("metric");
      when(() => networkService.executeRequest(any())).thenAnswer((_) async {
        return apiResponse;
      });

      final response =
          await dataSource.fetchDailyWeather(TemperatureUnit.celsius);

      verify(() => networkService.executeRequest(any())).called(1);

      expect(response.isRight(), true);
    });
  });
}
