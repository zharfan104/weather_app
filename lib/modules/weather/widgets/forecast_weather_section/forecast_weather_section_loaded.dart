import 'package:flutter/material.dart';

import '../../../models/weather_model.dart';
import '../weather_info_item/weather_info_item.dart';

class ForecastWeatherSectionLoaded extends StatelessWidget {
  const ForecastWeatherSectionLoaded({
    super.key,
    required this.weathers,
  });

  final List<WeatherModel> weathers;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weathers
          .map((weather) => WeatherInfoItem.small(weather: weather))
          .toList(),
    );
  }
}
