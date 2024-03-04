import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/common/exception/network_exception.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_bloc.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_event.dart';
import 'package:flutter_weather_app/presentation/bloc/view_daily_weather_state.dart';
import 'package:flutter_weather_app/utils/temperature_unit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mocks.dart';

void main() {
  final usecase = MockFetchDailyWeatherUseCase();

  ViewDailyWeatherBloc buildBloc() => ViewDailyWeatherBloc(usecase);

  setUpAll(() {
    registerFallbackValue(TemperatureUnit.celsius);
  });

  group("View Daily Weather Bloc Test", () {
    blocTest<ViewDailyWeatherBloc, ViewDailyWeatherState>(
      "Should emit [ViewDailyWeatherInitial] when initialized",
      build: buildBloc,
      verify: (bloc) {
        expect(bloc.state, ViewDailyWeatherInitial());
      },
    );

    blocTest<ViewDailyWeatherBloc, ViewDailyWeatherState>(
      'emits [ViewDailyWeatherLoading, ViewDailyWeatherDataLoaded] when GetDailyWeatherEvent is added and success',
      build: buildBloc,
      act: (bloc) {
        when(() => usecase.call(any()))
            .thenAnswer((_) async => const Left([mockWeatherEntity]));
        bloc.add(GetDailyWeatherEvent(unit: TemperatureUnit.celsius));
      },
      verify: (bloc) {
        verifyInOrder([
          () => isA<ViewDailyWeatherLoading>(),
          () => isA<ViewDailyWeatherDataLoaded>()
        ]);
      },
    );

    blocTest<ViewDailyWeatherBloc, ViewDailyWeatherState>(
      'emits [ViewDailyWeatherLoading, ViewDailyWeatherError] when GetDailyWeatherEvent is added and failed',
      build: buildBloc,
      act: (bloc) {
        when(() => usecase.call(any()))
            .thenAnswer((_) async => const Right(NetworkException('error')));
        bloc.add(GetDailyWeatherEvent(unit: TemperatureUnit.celsius));
      },
      verify: (bloc) {
        verifyInOrder([
          () => isA<ViewDailyWeatherLoading>(),
          () => isA<ViewDailyWeatherError>()
        ]);
      },
    );

    blocTest<ViewDailyWeatherBloc, ViewDailyWeatherState>(
      'emits [ViewDailyWeatherLoading, ViewDailyWeatherDataLoaded] when GetDailySelectedWeatherEvent is called',
      build: buildBloc,
      act: (bloc) {
        when(() => usecase.call(any()))
            .thenAnswer((_) async => const Left([mockWeatherEntity]));
        bloc.add(GetDailyWeatherEvent(unit: TemperatureUnit.celsius));
        bloc.add(GetDailySelectedWeatherEvent(
            weatherDailyItemUiEntity: mockWeatherUiEntity));
      },
      verify: (bloc) {
        verifyInOrder([
          () => isA<ViewDailyWeatherLoading>(),
          () => isA<ViewDailyWeatherDataLoaded>()
        ]);
      },
    );
  });
}
