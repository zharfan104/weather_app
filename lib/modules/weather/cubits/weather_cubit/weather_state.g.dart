// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherStateCWProxy {
  WeatherState city(String city);

  WeatherState forecastLoadDataState(
      LoadDataState<ForecastModel> forecastLoadDataState);

  WeatherState weatherLoadDataState(
      LoadDataState<WeatherModel> weatherLoadDataState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    String? city,
    LoadDataState<ForecastModel>? forecastLoadDataState,
    LoadDataState<WeatherModel>? weatherLoadDataState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherState.copyWith.fieldName(...)`
class _$WeatherStateCWProxyImpl implements _$WeatherStateCWProxy {
  final WeatherState _value;

  const _$WeatherStateCWProxyImpl(this._value);

  @override
  WeatherState city(String city) => this(city: city);

  @override
  WeatherState forecastLoadDataState(
          LoadDataState<ForecastModel> forecastLoadDataState) =>
      this(forecastLoadDataState: forecastLoadDataState);

  @override
  WeatherState weatherLoadDataState(
          LoadDataState<WeatherModel> weatherLoadDataState) =>
      this(weatherLoadDataState: weatherLoadDataState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    Object? city = const $CopyWithPlaceholder(),
    Object? forecastLoadDataState = const $CopyWithPlaceholder(),
    Object? weatherLoadDataState = const $CopyWithPlaceholder(),
  }) {
    return WeatherState(
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      forecastLoadDataState:
          forecastLoadDataState == const $CopyWithPlaceholder() ||
                  forecastLoadDataState == null
              ? _value.forecastLoadDataState
              // ignore: cast_nullable_to_non_nullable
              : forecastLoadDataState as LoadDataState<ForecastModel>,
      weatherLoadDataState:
          weatherLoadDataState == const $CopyWithPlaceholder() ||
                  weatherLoadDataState == null
              ? _value.weatherLoadDataState
              // ignore: cast_nullable_to_non_nullable
              : weatherLoadDataState as LoadDataState<WeatherModel>,
    );
  }
}

extension $WeatherStateCopyWith on WeatherState {
  /// Returns a callable class that can be used as follows: `instanceOfWeatherState.copyWith(...)` or like so:`instanceOfWeatherState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherStateCWProxy get copyWith => _$WeatherStateCWProxyImpl(this);
}
