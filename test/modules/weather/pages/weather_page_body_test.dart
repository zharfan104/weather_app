import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/modules/weather/pages/weather_page_body.dart';
import 'package:weather_app/modules/weather/widgets/city_search_box/city_search_box.dart';
import 'package:weather_app/modules/weather/widgets/current_weather_section/current_weather_section.dart';
import 'package:weather_app/modules/weather/widgets/forecast_weather_section/forecast_weather_section.dart';
import 'package:weather_app/modules/weather/widgets/searched_city_details/searched_city_details.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../../utils/when_listen_one_state_cubit.dart';

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherCubit {
}

void main() {
  late WeatherCubit weatherCubit;

  setUp(() {
    weatherCubit = MockWeatherCubit();
  });

  Future<void> pumpWeatherPageBody(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: weatherCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: WeatherPageBody(),
          ),
        ),
      ),
    );
  }

  group('WeatherPageBody', () {
    testWidgets('renders all widgets', (WidgetTester tester) async {
      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: InitialDataState(),
          weatherLoadDataState: InitialDataState(),
          city: 'Jakarta',
        ),
      );

      await pumpWeatherPageBody(tester);

      expect(find.byType(CitySearchBox), findsOneWidget);
      expect(find.byType(SearchedCityDetails), findsOneWidget);
      expect(find.byType(CurrentWeatherSection), findsOneWidget);
      expect(find.byType(ForecastWeatherSection), findsOneWidget);
    });

    testWidgets('calls getWeatherAndForecastData on init',
        (WidgetTester tester) async {
      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: InitialDataState(),
          weatherLoadDataState: InitialDataState(),
          city: 'Jakarta',
        ),
      );

      await pumpWeatherPageBody(tester);

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: weatherCubit),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: WeatherPageBody(),
            ),
          ),
        ),
      );

      verify(() => weatherCubit.getWeatherAndForecastData()).called(1);
    });
  });
}
