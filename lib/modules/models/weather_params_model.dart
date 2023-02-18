import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_params_model.g.dart';
part 'weather_params_model.freezed.dart';

// ignore_for_file: invalid_annotation_target

@freezed
class WeatherParamsModel with _$WeatherParamsModel {
  factory WeatherParamsModel({
    required double temp,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
  }) = _WeatherParamsModel;

  factory WeatherParamsModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherParamsModelFromJson(json);
}
