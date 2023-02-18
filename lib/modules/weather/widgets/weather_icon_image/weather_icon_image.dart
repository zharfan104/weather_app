import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({
    super.key,
    required this.icon,
    required this.size,
  });

  String get iconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconUrl,
      width: size,
      height: size,
    );
  }
}
