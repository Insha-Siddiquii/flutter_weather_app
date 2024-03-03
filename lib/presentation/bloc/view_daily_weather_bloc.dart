import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_event.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_state.dart';
import 'package:flutter_weather_app/presentation/entity/weather_daily_item_ui_entity.dart';

class ViewDailyWeatherBloc
    extends Bloc<ViewDailyWeatherEvent, ViewDailyWeatherState> {
  final FetchDailyWeatherUseCase _fetchDailyWeatherUseCase;
  late List<WeatherDailyItemUiEntity> dailyWeatherList;

  ViewDailyWeatherBloc(this._fetchDailyWeatherUseCase)
      : super(ViewDailyWeatherInitial()) {
    on<GetDailyWeatherEvent>(_fetchWeatherData);

    on<GetDailySelectedWeatherEvent>(_getSelectedDailyWeatherData);
  }

  void _getSelectedDailyWeatherData(
    GetDailySelectedWeatherEvent event,
    Emitter<ViewDailyWeatherState> emit,
  ) {
    emit(
      ViewDailyWeatherDataLoaded(
        dailyWeatherList,
        event.weatherDailyItemUiEntity,
      ),
    );
  }

  void _fetchWeatherData(
    GetDailyWeatherEvent event,
    Emitter<ViewDailyWeatherState> emit,
  ) async {
    emit(ViewDailyWeatherLoading());

    final data = await _fetchDailyWeatherUseCase.call(event.unit);

    data.fold(
      (weatherEntity) {
        final weatherUiEntity = weatherEntity
            .map((e) => WeatherDailyItemUiEntity.copyFrom(e))
            .toList();

        dailyWeatherList = weatherUiEntity;

        emit(
          ViewDailyWeatherDataLoaded(
            weatherUiEntity,
            weatherUiEntity.first,
          ),
        );
      },
      (exception) => emit(
        ViewDailyWeatherError("Something went wrong. Please try again"),
      ),
    );
  }
}
