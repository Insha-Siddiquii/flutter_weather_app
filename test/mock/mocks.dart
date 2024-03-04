import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/common/network/network_service_impl.dart';
import 'package:flutter_weather_app/data/converter/temperature_unit_converter.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source.dart';
import 'package:flutter_weather_app/data/model/weather_daily_model.dart';
import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/domain/repository/fetch_daily_weather_repository.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchDailyWeatherUseCase extends Mock
    implements FetchDailyWeatherUseCase {}

class MockFetchDailyWeatherRepository extends Mock
    implements FetchDailyWeatherRepository {}

class MockFetchDailyWeatherDataSource extends Mock
    implements FetchDailyWeatherDataSource {}

class MockNetworkService extends Mock implements NetworkService {}

class MockTemperatureValueConverter extends Mock
    implements TemperatureValueConverter {}

const mockWeatherList = Left([
  WeatherDailyItemEntity(
    temperature: 11,
    minTemperature: 11,
    maxTemperature: 11,
    humidity: 11,
    pressure: 11,
    windSpeed: 11,
    name: 'test',
    imageIcon: 'test',
    dailyTime: 11,
    temperatureUnit: TemperatureUnit.celsius,
  )
]);

const mockWeatherEntity = WeatherDailyItemEntity(
  temperature: 11,
  minTemperature: 11,
  maxTemperature: 11,
  humidity: 11,
  pressure: 11,
  windSpeed: 11,
  name: 'test',
  imageIcon: 'test',
  dailyTime: 11,
  temperatureUnit: TemperatureUnit.celsius,
);

const mockWeatherModel = WeatherDailyModel(
  11,
  11,
  11,
  mockTemperature,
  [mockWeather],
  11,
);

const mockTemperature = Temperature(
  11,
  11,
  11,
);

const mockWeather = Weather('test', 'test');
const mockWeatherUiEntity = WeatherDailyItemUiEntity(
  temperature: "11",
  minTemperature: "11",
  maxTemperature: "11",
  humidity: "11%",
  pressure: "11 hpa",
  windSpeed: "17.70274 km/h",
  fullDayName: "Thursday",
  shortDayName: "Thu",
  weatherName: "test",
  imageUrl: "test",
  temperatureUnit: TemperatureUnit.celsius,
);

const mockException = Right(NetworkException("test erorr"));

const weatherResponse = {
  "daily": [
    {
      "dt": 1709463600,
      "sunrise": 1709444870,
      "sunset": 1709484533,
      "moonrise": 1709427960,
      "moonset": 1709453400,
      "moon_phase": 0.75,
      "summary": "Expect a day of partly cloudy with clear spells",
      "temp": {
        "day": 12.49,
        "min": 7.69,
        "max": 12.49,
        "night": 9.77,
        "eve": 10.98,
        "morn": 8.19
      },
      "feels_like": {"day": 11.44, "night": 8.78, "eve": 9.99, "morn": 6.36},
      "pressure": 1005,
      "humidity": 63,
      "dew_point": 5.68,
      "wind_speed": 4.12,
      "wind_deg": 114,
      "wind_gust": 10.98,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": 99,
      "pop": 0,
      "uvi": 1.18
    },
  ]
};
