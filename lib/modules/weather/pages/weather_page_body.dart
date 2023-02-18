import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/resources/constants/spacing.dart';

import '../../../resources/colors/app_colors.dart';
import '../cubits/weather_cubit/weather_cubit.dart';
import '../widgets/city_search_box/city_search_box.dart';
import '../widgets/current_weather_section/current_weather_section.dart';
import '../widgets/forecast_weather_section/forecast_weather_section.dart';
import '../widgets/searched_city_details/searched_city_details.dart';

class WeatherPageBody extends StatefulWidget {
  const WeatherPageBody({
    super.key,
  });

  @override
  State<WeatherPageBody> createState() => _WeatherPageBodyState();
}

class _WeatherPageBodyState extends State<WeatherPageBody> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeatherAndForecastData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: kSpacingLarge),
              CitySearchBox(),
              SizedBox(height: kSpacingLarge),
              SearchedCityDetails(),
              SizedBox(height: kSpacingXLarge),
              CurrentWeatherSection(),
              SizedBox(height: kSpacingXLarge),
              ForecastWeatherSection(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
