import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/pages/weather_page_body.dart';
import 'package:weather_app/modules/weather/repositories/weather_repository.dart';

import '../../../core/get_it/get_it.dart';
import '../cubits/weather_cubit/weather_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        weatherRepository: sl<WeatherRepository>(),
      ),
      child: const WeatherPageBody(),
    );
  }
}
