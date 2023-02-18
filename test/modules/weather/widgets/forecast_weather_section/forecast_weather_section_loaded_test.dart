import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/models/weather_info_model.dart';
import 'package:weather_app/modules/models/weather_model.dart';
import 'package:weather_app/modules/models/weather_params_model.dart';
import 'package:weather_app/modules/weather/widgets/forecast_weather_section/forecast_weather_section_loaded.dart';
import 'package:weather_app/modules/weather/widgets/weather_info_item/weather_info_item.dart';

// ignore_for_file: avoid_as

void main() {
  group('ForecastWeatherSectionLoaded', () {
    testWidgets('displays the list of weather info items', (tester) async {
      final mockWeathers = [
        WeatherModel(
          dt: 1645200000,
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
        ),
        WeatherModel(
          dt: 1645286400,
          weatherInfo: [
            WeatherInfoModel(
              main: 'Clouds',
              description: 'few clouds',
              icon: '02d',
            ),
          ],
          weatherParams: WeatherParamsModel(
            temp: 80,
            tempMin: 10,
            tempMax: 80,
          ),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ForecastWeatherSectionLoaded(weathers: mockWeathers),
          ),
        ),
      );

      // Ensure that the correct number of weather info items are displayed
      expect(find.byType(WeatherInfoItem), findsNWidgets(2));

      // Ensure that the weather info items are displayed in the correct order
      final weatherTextList = find
          .descendant(
            of: find.byType(ForecastWeatherSectionLoaded),
            matching: find.byType(Text),
          )
          .evaluate()
          .map((t) => t.widget as Text)
          .toList();

      final expectedDates = ['Friday', 'Saturday'];
      final expectedTemperatures = ['90', '80'];
      final expectedHighsAndLows = ['H:90° L:0°', 'H:80° L:10°'];

      final actualTemperatures = weatherTextList
          .where((text) => text.style!.fontSize == 24.0)
          .map((text) => text.data)
          .toList();
      final actualHighsAndLows = weatherTextList
          .where((text) => text.data!.contains('H') && text.data!.contains('L'))
          .map((text) => text.data)
          .toList();

      for (final expectedDate in expectedDates) {
        expect(find.text(expectedDate), findsOneWidget);
      }

      expect(actualTemperatures, expectedTemperatures);
      expect(actualHighsAndLows, expectedHighsAndLows);
    });
  });
}
