import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/common/exception/base_exception.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/common/network/network_service_impl.dart';
import 'package:flutter_weather_app/data/converter/temperature_unit_converter.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source.dart';
import 'package:flutter_weather_app/data/model/weather_daily_model.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class FetchDailyWeatherDataSourceImpl implements FetchDailyWeatherDataSource {
  final TemperatureValueConverter _temperatureValueConverter;
  final NetworkService _networkService;

  FetchDailyWeatherDataSourceImpl(
      this._networkService, this._temperatureValueConverter);
  @override
  Future<Either<List<WeatherDailyModel>, BaseException>> fetchDailyWeather(
    TemperatureUnit unit,
  ) async {
    final temperatureValue =
        _temperatureValueConverter.getTemperatureUnitValue(unit);
    final result = await _networkService.executeRequest(temperatureValue);

    return result.fold((response) {
      try {
        final List<WeatherDailyModel> model = List.empty(growable: true);
        final responseDataList = response["daily"];

        for (var element in responseDataList) {
          model.add(WeatherDailyModel.fromJson(element));
        }

        return Left(model);
      } catch (e) {
        return Right(NetworkException(
          e.toString(),
        ));
      }
    }, Right.new);
  }
}
