import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';
import 'package:flutter_weather_app/presentation/widgets/weather_days_slider.dart';
import 'package:flutter_weather_app/presentation/widgets/weather_selected_widget.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';

class WeatherContent extends StatelessWidget {
  const WeatherContent({
    super.key,
    required this.weather,
    required this.weatherList,
    required this.onTemperatureUnitTap,
    required this.onWeatherCardClick,
  });

  final List<WeatherDailyItemUiEntity> weatherList;
  final WeatherDailyItemUiEntity weather;
  final void Function(TemperatureUnit unit) onTemperatureUnitTap;
  final void Function(WeatherDailyItemUiEntity selectedWeather)
      onWeatherCardClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Weather Selected Widget
        WeatherSelectedWidget(
          onTemperatureUnitTap: onTemperatureUnitTap,
          weather: weather,
        ),

        const SizedBox(
          height: 30.0,
        ),

        /// Weather Days Slider
        WeatherDaysSlider(
          weatherList: weatherList,
          onWeatherCardClick: (selectedWeather) =>
              onWeatherCardClick(selectedWeather),
        )
      ],
    );
  }
}
