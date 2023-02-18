import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/modules/models/forecast_model.dart';
import 'package:weather_app/modules/models/weather_model.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/modules/weather/repositories/weather_repository.dart';

import 'package:weather_app/utils/state/load_data_state.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeatherModel extends Mock implements WeatherModel {}

class MockForecastModel extends Mock implements ForecastModel {}

class MockDioError extends Mock implements DioError {}

// ignore_for_file: discarded_futures

void main() {
  group('WeatherCubit', () {
    late WeatherRepository weatherRepository;
    late WeatherCubit weatherCubit;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      weatherCubit = WeatherCubit(weatherRepository: weatherRepository);
    });

    group('getWeatherAndForecastData', () {
      final mockWeather = MockWeatherModel();
      final mockForecast = MockForecastModel();

      blocTest<WeatherCubit, WeatherState>(
        'emits LoadedDataState for weather and forecast',
        build: () {
          when(() => weatherRepository.getWeather(city: any(named: 'city')))
              .thenAnswer((_) async => mockWeather);
          when(() => weatherRepository.getForecast(city: any(named: 'city')))
              .thenAnswer((_) async => mockForecast);
          return weatherCubit;
        },
        act: (cubit) {
          cubit.getWeatherAndForecastData();
        },
        expect: () => [
          WeatherState(
            weatherLoadDataState: LoadingDataState(),
            forecastLoadDataState: InitialDataState(),
            city: 'Jakarta',
          ),
          WeatherState(
            weatherLoadDataState: LoadingDataState(),
            forecastLoadDataState: LoadingDataState(),
            city: 'Jakarta',
          ),
          WeatherState(
            weatherLoadDataState: LoadedDataState(data: mockWeather),
            forecastLoadDataState: LoadingDataState(),
            city: 'Jakarta',
          ),
          WeatherState(
            weatherLoadDataState: LoadedDataState(data: mockWeather),
            forecastLoadDataState: LoadedDataState(data: mockForecast),
            city: 'Jakarta',
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits ErrorDataState for weather and forecast when DioError is thrown',
        build: () {
          final mockDioError = DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              data: {'message': 'City not found'},
              requestOptions: RequestOptions(path: ''),
            ),
          );

          when(() => weatherRepository.getWeather(city: any(named: 'city')))
              .thenThrow(mockDioError);
          when(() => weatherRepository.getForecast(city: any(named: 'city')))
              .thenThrow(mockDioError);
          return weatherCubit;
        },
        act: (cubit) {
          cubit.getWeatherAndForecastData();
        },
        expect: () => [
          WeatherState(
            weatherLoadDataState: LoadingDataState(),
            forecastLoadDataState: InitialDataState(),
            city: 'Jakarta',
          ),
          WeatherState(
            weatherLoadDataState: const ErrorDataState(
              errorMessage: 'City not found',
            ),
            forecastLoadDataState: InitialDataState(),
            city: 'Jakarta',
          ),
          WeatherState(
            weatherLoadDataState: const ErrorDataState(
              errorMessage: 'City not found',
            ),
            forecastLoadDataState: LoadingDataState(),
            city: 'Jakarta',
          ),
          const WeatherState(
            weatherLoadDataState:
                ErrorDataState(errorMessage: 'City not found'),
            forecastLoadDataState:
                ErrorDataState(errorMessage: 'City not found'),
            city: 'Jakarta',
          ),
        ],
      );
    });

    group('onCityChanged', () {
      blocTest<WeatherCubit, WeatherState>(
        'emits the new city',
        build: () => weatherCubit,
        act: (cubit) {
          cubit.onCityChanged('New York');
        },
        expect: () => [
          WeatherState(
            weatherLoadDataState: InitialDataState(),
            forecastLoadDataState: InitialDataState(),
            city: 'New York',
          ),
        ],
      );
    });
  });
}
