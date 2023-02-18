import 'package:flutter/material.dart';

import 'modules/weather/pages/weather_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: WeatherPage(),
    );
  }
}
