import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/resources/widgets/loading_indicator.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../../../resources/widgets/error_text.dart';
import '../../cubits/weather_cubit/weather_cubit.dart';
import '../../cubits/weather_cubit/weather_state.dart';
import 'forecast_weather_section_loaded.dart';

const _kMinimumForecastList = 33;
// API returns data points in 3-hour intervals -> 1 day = 8 intervals
const _kForecastListPerDayIndex = [0, 8, 16, 24, 32];

class ForecastWeatherSection extends StatelessWidget {
  const ForecastWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final forecastLoadDataState = state.forecastLoadDataState;

        /// Only show Forecast error when the weather section is not error
        /// So, the error is not duplicate
        if (!state.weatherLoadDataState.isError) {
          if (forecastLoadDataState.isError) {
            return ErrorText(
              errorMessage: forecastLoadDataState.getErrorMessage!,
            );
          }
        }

        if (forecastLoadDataState.isLoading) {
          return const LoadingIndicator();
        }

        if (forecastLoadDataState.isLoaded) {
          final forecastData = forecastLoadDataState.getData!;

          if (forecastData.list.length >= _kMinimumForecastList) {
            return ForecastWeatherSectionLoaded(
              weathers: [
                for (var i in _kForecastListPerDayIndex) forecastData.list[i],
              ],
            );
          }
        }

        return const SizedBox();
      },
    );
  }
}
