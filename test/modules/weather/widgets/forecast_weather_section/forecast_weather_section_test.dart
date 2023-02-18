import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/models/forecast_model.dart';
import 'package:weather_app/modules/models/weather_info_model.dart';
import 'package:weather_app/modules/models/weather_model.dart';
import 'package:weather_app/modules/models/weather_params_model.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/modules/weather/widgets/forecast_weather_section/forecast_weather_section.dart';
import 'package:weather_app/modules/weather/widgets/forecast_weather_section/forecast_weather_section_loaded.dart';
import 'package:weather_app/modules/weather/widgets/weather_info_item/weather_info_item.dart';
import 'package:weather_app/resources/widgets/error_text.dart';
import 'package:weather_app/resources/widgets/loading_indicator.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../../../utils/when_listen_one_state_cubit.dart';

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherCubit {
}

void main() {
  late WeatherCubit weatherCubit;

  setUp(() {
    weatherCubit = MockWeatherCubit();
  });

  Future<void> pumpForecastWeatherSection(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: weatherCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: ForecastWeatherSection(),
          ),
        ),
      ),
    );
  }

  group('ForecastWeatherSection', () {
    testWidgets('displays loading indicator when data is loading',
        (WidgetTester tester) async {
      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: LoadingDataState(),
          weatherLoadDataState: LoadingDataState(),
          city: 'Jakarta',
        ),
      );

      await pumpForecastWeatherSection(tester);

      expect(find.byType(LoadingIndicator), findsOneWidget);
      expect(find.byType(ErrorText), findsNothing);
    });

    testWidgets('displays error text when data loading failed',
        (WidgetTester tester) async {
      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: const ErrorDataState(
            errorMessage: 'Failed to load forecast data.',
          ),
          weatherLoadDataState: InitialDataState(),
          city: 'Jakarta',
        ),
      );

      await pumpForecastWeatherSection(tester);

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(ErrorText), findsOneWidget);
    });

    testWidgets(
        'displays forecast weather section when data is loaded with 33 items',
        (WidgetTester tester) async {
      final mockWeather = WeatherModel(
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

      final mockForecast = ForecastModel(
        list: List.generate(33, (index) => mockWeather),
      );

      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: LoadedDataState(data: mockForecast),
          weatherLoadDataState: InitialDataState(),
          city: 'Jakarta',
        ),
      );

      await pumpForecastWeatherSection(tester);

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(ErrorText), findsNothing);
      expect(find.byType(ForecastWeatherSectionLoaded), findsOneWidget);
      expect(find.byType(WeatherInfoItem), findsNWidgets(5));
    });
  });
}
