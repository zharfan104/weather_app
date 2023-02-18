import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_cubit.dart';

import '../../../../utils/state/load_data_state.dart';
import '../../cubits/weather_cubit/weather_state.dart';

class SearchedCityDetails extends StatelessWidget {
  const SearchedCityDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) =>
          current.weatherLoadDataState is LoadingDataState,
      builder: (context, state) {
        return Text('Weather in: ${state.city}');
      },
    );
  }
}
