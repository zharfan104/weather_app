import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/dio_error_extension.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../repositories/weather_repository.dart';

const _kDefaultCity = 'Jakarta';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherRepository})
      : super(WeatherState(
          forecastLoadDataState: InitialDataState(),
          weatherLoadDataState: InitialDataState(),
          city: _kDefaultCity,
        ));

  final WeatherRepository weatherRepository;

  void getWeatherAndForecastData() {
    if (state.city.isEmpty) return;

    unawaited(getWeather());
    unawaited(getForecast());
  }

  @visibleForTesting
  Future<void> getWeather() async {
    emit(state.copyWith(weatherLoadDataState: LoadingDataState()));

    try {
      final weather = await weatherRepository.getWeather(city: state.city);

      emit(
        state.copyWith(weatherLoadDataState: LoadedDataState(data: weather)),
      );
    } on DioError catch (dioError) {
      emit(
        state.copyWith(
            weatherLoadDataState: ErrorDataState(
          errorMessage: dioError.capitalizeErrorMessage,
        )),
      );
    } catch (error, stackTrace) {
      // TODO(zharfan104): Will log to crashlytics
      super.onError(error, stackTrace);
    }
  }

  @visibleForTesting
  Future<void> getForecast() async {
    emit(state.copyWith(forecastLoadDataState: LoadingDataState()));

    try {
      final forecast = await weatherRepository.getForecast(city: state.city);

      emit(state.copyWith(
        forecastLoadDataState: LoadedDataState(data: forecast),
      ));
    } on DioError catch (dioError) {
      emit(
        state.copyWith(
            forecastLoadDataState: ErrorDataState(
          errorMessage: dioError.capitalizeErrorMessage,
        )),
      );
    } catch (error, stackTrace) {
      // TODO(zharfan104): Will log to crashlytics
      super.onError(error, stackTrace);
    }
  }

  void onCityChanged(String city) {
    emit(state.copyWith(city: city));
  }
}
