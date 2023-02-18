import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/modules/weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/modules/weather/widgets/city_search_box/city_search_box.dart';
import 'package:weather_app/utils/state/load_data_state.dart';

import '../../../../utils/when_listen_one_state_cubit.dart';

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherCubit {
}

void main() {
  late WeatherCubit weatherCubit;

  setUp(() {
    weatherCubit = MockWeatherCubit();
    whenListenOneStateCubit(
      weatherCubit,
      WeatherState(
        forecastLoadDataState: InitialDataState(),
        weatherLoadDataState: InitialDataState(),
        city: 'London',
      ),
    );
  });

  Future<void> pumpCitySearchBox(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: weatherCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: CitySearchBox(),
          ),
        ),
      ),
    );
  }

  group('CitySearchBox', () {
    testWidgets('updates state when text is entered',
        (WidgetTester tester) async {
      when(() => weatherCubit.onCityChanged('Jakarta')).thenReturn(null);

      await pumpCitySearchBox(tester);

      await tester.enterText(find.byType(TextFormField), 'Jakarta');

      verify(() => weatherCubit.onCityChanged('Jakarta')).called(1);
    });

    testWidgets('calls getWeatherAndForecastData when search button is tapped',
        (WidgetTester tester) async {
      when(() => weatherCubit.getWeatherAndForecastData()).thenReturn(null);

      await pumpCitySearchBox(tester);

      await tester.tap(find.text('Search'));

      verify(() => weatherCubit.getWeatherAndForecastData()).called(1);
    });
  });
}
