import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

abstract class ViewDailyWeatherEvent {}

class GetDailyWeatherEvent extends ViewDailyWeatherEvent {
  final TemperatureUnit unit;

  GetDailyWeatherEvent({required this.unit});
}

class GetDailySelectedWeatherEvent extends ViewDailyWeatherEvent {
  final WeatherDailyItemUiEntity weatherDailyItemUiEntity;

  GetDailySelectedWeatherEvent({
    required this.weatherDailyItemUiEntity,
  });
}
