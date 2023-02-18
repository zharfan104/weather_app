import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../modules/models/weather_model.dart';
import '../../modules/models/forecast_model.dart';
import 'api_constant.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/weather')
  Future<WeatherModel> getWeather(
    @Query('q') String city, {
    @Query('appid') String apiKey = ApiConstant.apiKey,
    @Query('units') String units = 'metric',
  });

  @GET('/forecast')
  Future<ForecastModel> getForecast(
    @Query('q') String city, {
    @Query('appid') String apiKey = ApiConstant.apiKey,
    @Query('units') String units = 'metric',
  });
}
