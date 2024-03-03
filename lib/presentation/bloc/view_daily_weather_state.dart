import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';

abstract class ViewDailyWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ViewDailyWeatherInitial extends ViewDailyWeatherState {
  @override
  List<Object?> get props => [...super.props];
}

class ViewDailyWeatherLoading extends ViewDailyWeatherState {
  @override
  List<Object?> get props => [...super.props];
}

class ViewDailyWeatherError extends ViewDailyWeatherState {
  final String errorMessage;

  ViewDailyWeatherError(this.errorMessage);

  @override
  List<Object?> get props => [
        ...super.props,
        errorMessage,
      ];
}

class ViewDailyWeatherDataLoaded extends ViewDailyWeatherState {
  final List<WeatherDailyItemUiEntity> dailyWeatherList;
  final WeatherDailyItemUiEntity selectedWeather;

  ViewDailyWeatherDataLoaded(
    this.dailyWeatherList,
    this.selectedWeather,
  );

  @override
  List<Object?> get props => [
        ...super.props,
        dailyWeatherList,
        selectedWeather,
      ];
}
