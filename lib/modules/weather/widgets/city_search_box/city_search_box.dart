import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/resources/constants/spacing.dart';

import '../../../../resources/colors/app_colors.dart';
import '../../cubits/weather_cubit/weather_cubit.dart';

const _kHorizontalPadding = 20.0;
const _kBorderRadius = 30.0;
const _kTextFieldHeight = 50.0;

class CitySearchBox extends StatelessWidget {
  const CitySearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: _kTextFieldHeight,
              child: TextFormField(
                onChanged: weatherCubit.onCityChanged,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_kBorderRadius),
                      bottomLeft: Radius.circular(_kBorderRadius),
                    ),
                  ),
                ),
                initialValue: weatherCubit.state.city,
                onFieldSubmitted: (_) => _onGetWeatherAndForecastData(context),
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.rainBlueDark,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_kBorderRadius),
                  bottomRight: Radius.circular(_kBorderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSpacingMedium),
                child: Text(
                  'Search',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            onTap: () => _onGetWeatherAndForecastData(context),
          )
        ],
      ),
    );
  }

  void _onGetWeatherAndForecastData(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<WeatherCubit>().getWeatherAndForecastData();
  }
}
