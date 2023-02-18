import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/weather_model.dart';
import '../weather_icon_image/weather_icon_image.dart';

const _kSmallWeatherIconImage = 60.0;
const _kMediumWeatherIconImage = 120.0;

class WeatherInfoItem extends StatelessWidget {
  const WeatherInfoItem({
    super.key,
    required this.weather,
  }) : size = WeatherInfoItemSize.medium;

  const WeatherInfoItem.small({
    super.key,
    required this.weather,
  }) : size = WeatherInfoItemSize.small;

  final WeatherInfoItemSize size;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final temp = weather.weatherParams.temp.toInt().toString();
    final minTemp = weather.weatherParams.tempMin.toInt().toString();
    final maxTemp = weather.weatherParams.tempMax.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat.EEEE().format(
            DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
          ),
        ),
        WeatherIconImage(
          icon: weather.weatherInfo.first.icon,
          size:
              size.isSmall ? _kSmallWeatherIconImage : _kMediumWeatherIconImage,
        ),
        Text(
          temp,
          style: size.isSmall ? textTheme.headline6 : textTheme.headline2,
        ),
        const SizedBox(height: 8),
        Text(
          highAndLow,
          style: size.isSmall ? textTheme.labelSmall : textTheme.bodyText2,
        ),
      ],
    );
  }
}

enum WeatherInfoItemSize { medium, small }

extension WeatherInfoItemSizeExtension on WeatherInfoItemSize {
  bool get isSmall => this == WeatherInfoItemSize.small;
}
