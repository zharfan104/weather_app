import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../../../resources/widgets/loading_indicator.dart';
import '../../cubits/weather_cubit/weather_cubit.dart';
import '../../cubits/weather_cubit/weather_state.dart';
import '../weather_info_item/weather_info_item.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final weatherLoadDataState = state.weatherLoadDataState;

        if (weatherLoadDataState.isError) {
          return Text(weatherLoadDataState.getErrorMessage!);
        }

        if (weatherLoadDataState.isLoading) {
          return const LoadingIndicator();
        }

        if (weatherLoadDataState.isLoaded) {
          final weather = weatherLoadDataState.getData!;

          return WeatherInfoItem(
            weather: weather,
          );
        }

        return const SizedBox();
      },
    );
  }
}
