import 'package:injectable/injectable.dart';

import '../../../core/api/rest_client.dart';
import '../models/forecast_model.dart';
import '../models/weather_model.dart';

@singleton
class WeatherRepository {
  WeatherRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<ForecastModel> getForecast({required String city}) =>
      restClient.getForecast(city);

  Future<WeatherModel> getWeather({required String city}) =>
      restClient.getWeather(city);
}
