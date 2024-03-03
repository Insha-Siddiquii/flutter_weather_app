import 'package:flutter_weather_app/domain/entity/weather_daily_item_entity.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';

abstract class UiEntityConverter {
  WeatherDailyItemUiEntity mapIntoWeatherUiEntity(
      WeatherDailyItemEntity weatherDailyItemEntity);
}

class UiEntityConverterImpl implements UiEntityConverter {
  @override
  WeatherDailyItemUiEntity mapIntoWeatherUiEntity(
      WeatherDailyItemEntity weatherDailyItemEntity) {
    return WeatherDailyItemUiEntity.copyFrom(weatherDailyItemEntity);
  }
}
