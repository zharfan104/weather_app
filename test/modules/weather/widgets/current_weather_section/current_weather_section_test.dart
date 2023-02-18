import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/models/weather_info_model.dart';
import 'package:weather_app/modules/models/weather_model.dart';
import 'package:weather_app/modules/models/weather_params_model.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/modules/weather/widgets/current_weather_section/current_weather_section.dart';
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

  Future<void> pumpCurrentWeatherSection(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: weatherCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: CurrentWeatherSection(),
          ),
        ),
      ),
    );
  }

  group('CurrentWeatherSection', () {
    testWidgets('displays loading indicator when data is loading',
        (WidgetTester tester) async {
      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: InitialDataState(),
          weatherLoadDataState: LoadingDataState(),
          city: 'Jakarta',
        ),
      );

      await pumpCurrentWeatherSection(tester);

      expect(find.byType(LoadingIndicator), findsOneWidget);
      expect(find.byType(WeatherInfoItem), findsNothing);
      expect(find.byType(ErrorText), findsNothing);
    });

    testWidgets('displays error text when data loading failed',
        (WidgetTester tester) async {
      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: InitialDataState(),
          weatherLoadDataState: const ErrorDataState(
            errorMessage: 'Failed to load weather data.',
          ),
          city: 'Jakarta',
        ),
      );

      await pumpCurrentWeatherSection(tester);

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(WeatherInfoItem), findsNothing);
      expect(find.byType(ErrorText), findsOneWidget);
    });

    testWidgets('displays weather info item when data is loaded',
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

      whenListenOneStateCubit(
        weatherCubit,
        WeatherState(
          forecastLoadDataState: InitialDataState(),
          weatherLoadDataState: LoadedDataState(data: mockWeather),
          city: 'Jakarta',
        ),
      );

      await pumpCurrentWeatherSection(tester);

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(WeatherInfoItem), findsOneWidget);
      expect(find.byType(ErrorText), findsNothing);
    });
  });
}
