import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/common/modules/di_module.dart';
import 'package:flutter_weather_app/common/network/dio_network_client.dart';
import 'package:flutter_weather_app/common/network/network_client.dart';
import 'package:flutter_weather_app/common/network/network_service_impl.dart';
import 'package:flutter_weather_app/data/converter/temperature_unit_converter.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source.dart';
import 'package:flutter_weather_app/data/datasources/remote/fetch_daily_weather_data_source_impl.dart';
import 'package:flutter_weather_app/data/repository/fetch_daily_weather_repository_impl.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case.dart';
import 'package:flutter_weather_app/domain/usecase/fetch_daily_weather_use_case_impl.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class DailyWeatherFetchModule extends DiModule {
  ViewDailyWeatherBloc get dailyWeatherBloc;
}

class DailyWeatherFetchModuleImpl extends DailyWeatherFetchModule {
  late ViewDailyWeatherBloc _dailyWeatherBloc;

  @override
  ViewDailyWeatherBloc get dailyWeatherBloc {
    return _dailyWeatherBloc;
  }

  @override
  FutureOr<void> setup() {
    final dio = Dio();
    final NetworkClient client = DioNetworkClientImpl(
      dio,
    );

    final NetworkService networkService = NetworkServiceImpl(client);

    final TemperatureValueConverter converter = TemperatureValueConverter();

    final FetchDailyWeatherDataSource dailyWeatherDataSource =
        FetchDailyWeatherDataSourceImpl(networkService, converter);

    final fetchDailyWeatherRepositoryImpl = FetchDailyWeatherRepositoryImpl(
      dailyWeatherDataSource,
    );

    final FetchDailyWeatherUseCase fetchDailyWeatherUseCase =
        FetchDailyWeatherUseCaseImpl(fetchDailyWeatherRepositoryImpl);

    _dailyWeatherBloc = ViewDailyWeatherBloc(
      fetchDailyWeatherUseCase,
    );
    GetIt.I.registerSingleton<ViewDailyWeatherBloc>(_dailyWeatherBloc);
  }

  @override
  void dispose() {
    GetIt.I.get<ViewDailyWeatherBloc>().close();
  }
}
