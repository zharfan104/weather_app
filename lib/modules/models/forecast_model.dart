import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/modules/models/weather_model.dart';

part 'forecast_model.g.dart';
part 'forecast_model.freezed.dart';

@freezed
class ForecastModel with _$ForecastModel {
  factory ForecastModel({
    required List<WeatherModel> list,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}
