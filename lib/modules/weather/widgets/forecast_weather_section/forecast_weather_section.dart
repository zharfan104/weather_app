import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/resources/widgets/loading_indicator.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../cubits/weather_cubit/weather_cubit.dart';
import '../../cubits/weather_cubit/weather_state.dart';
import 'forecast_weather_section_loaded.dart';

class ForecastWeatherSection extends StatelessWidget {
  const ForecastWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final forecastLoadDataState = state.forecastLoadDataState;

        if (forecastLoadDataState.isError) {
          return Text(forecastLoadDataState.getErrorMessage!);
        }

        if (forecastLoadDataState.isLoading) {
          return const LoadingIndicator();
        }

        if (forecastLoadDataState.isLoaded) {
          final forecastData = forecastLoadDataState.getData!;

          // API returns data points in 3-hour intervals -> 1 day = 8 intervals
          final items = [0, 8, 16, 24, 32];
          return ForecastWeatherSectionLoaded(
            weathers: [
              for (var i in items) forecastData.list[i],
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
