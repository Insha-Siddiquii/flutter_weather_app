import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/common/widgets/weather_app_error_screen.dart';
import 'package:flutter_weather_app/common/widgets/weather_app_loading_indicator.dart';
import 'package:flutter_weather_app/di/daily_weather_fetch_module.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_bloc.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_event.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_state.dart';
import 'package:flutter_weather_app/presentation/widgets/weather_content.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({super.key});

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  late DailyWeatherFetchModule _dailyWeatherFetchModule;
  late ViewDailyWeatherBloc _bloc;
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _initModule();
    _fetchWeatherData();
  }

  void _initModule() {
    _dailyWeatherFetchModule = DailyWeatherFetchModuleImpl();
    _dailyWeatherFetchModule.setup();
    _bloc = _dailyWeatherFetchModule.dailyWeatherBloc;
    _refreshController = RefreshController(initialRefresh: false);
  }

  void _fetchWeatherData({TemperatureUnit? unit}) {
    _bloc.add(GetDailyWeatherEvent(unit: unit ?? TemperatureUnit.celsius));
  }

  @override
  void dispose() {
    _dailyWeatherFetchModule.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RepositoryProvider(
          create: (context) => _dailyWeatherFetchModule,
          child: BlocBuilder<ViewDailyWeatherBloc, ViewDailyWeatherState>(
            bloc: _bloc,
            builder: (context, state) {
              /// LOADING STATE
              if (state is ViewDailyWeatherLoading) {
                return const WeatherAppLoadingIndicator();

                /// ERROR STATE
              } else if (state is ViewDailyWeatherError) {
                return WeatherAppErrorScreen(
                  errorMessage: state.errorMessage,
                  onPressed: _fetchWeatherData,
                );

                /// DATA SUCCESS STATE
              } else if (state is ViewDailyWeatherDataLoaded) {
                return SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: false,
                  onRefresh: _fetchWeatherData,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: WeatherContent(
                      weather: state.selectedWeather,
                      weatherList: state.dailyWeatherList,
                      onTemperatureUnitTap: (unit) {
                        _fetchWeatherData(unit: unit);
                      },
                      onWeatherCardClick: (selectedWeather) => _bloc.add(
                        GetDailySelectedWeatherEvent(
                          weatherDailyItemUiEntity: selectedWeather,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
