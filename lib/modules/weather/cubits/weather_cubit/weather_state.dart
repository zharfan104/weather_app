import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/state/load_data_state.dart';
import '../../../models/forecast_model.dart';
import '../../../models/weather_model.dart';

part 'weather_state.g.dart';

@CopyWith()
class WeatherState extends Equatable {
  final LoadDataState<WeatherModel> weatherLoadDataState;
  final LoadDataState<ForecastModel> forecastLoadDataState;
  final String city;

  const WeatherState({
    required this.weatherLoadDataState,
    required this.forecastLoadDataState,
    required this.city,
  });

  @override
  List<Object?> get props =>
      [weatherLoadDataState, forecastLoadDataState, city];
}
