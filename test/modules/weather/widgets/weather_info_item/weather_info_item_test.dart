import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/models/weather_info_model.dart';
import 'package:weather_app/modules/models/weather_model.dart';
import 'package:weather_app/modules/models/weather_params_model.dart';
import 'package:weather_app/modules/weather/widgets/weather_icon_image/weather_icon_image.dart';
import 'package:weather_app/modules/weather/widgets/weather_info_item/weather_info_item.dart';

void main() {
  late WeatherModel weather;
  late Widget widget;

  setUp(() {
    weather = WeatherModel(
      dt: 1645200000, // 19th Feb 2022 12:00:00 AM (timestamp in seconds)
      weatherInfo: [
        WeatherInfoModel(
          main: 'Rain',
          description: 'light rain',
          icon: '10d',
        ),
      ],
      weatherParams: WeatherParamsModel(
        temp: 90,
        tempMin: 0,
        tempMax: 90,
      ),
    );

    widget = MaterialApp(
      home: Scaffold(
        body: WeatherInfoItem(
          weather: weather,
        ),
      ),
    );
  });

  testWidgets('renders WeatherInfoItem', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    expect(find.text('Friday'), findsOneWidget);
    expect(find.byType(WeatherIconImage), findsOneWidget);
    expect(find.text('90'), findsOneWidget);
    expect(find.text('H:90° L:0°'), findsOneWidget);
  });

  testWidgets('renders WeatherInfoItem with small size',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherInfoItem.small(
            weather: weather,
          ),
        ),
      ),
    );

    expect(find.text('Friday'), findsOneWidget);
    expect(find.byType(WeatherIconImage), findsOneWidget);
    expect(find.text('90'), findsOneWidget);
    expect(find.text('H:90° L:0°'), findsOneWidget);
  });
}
