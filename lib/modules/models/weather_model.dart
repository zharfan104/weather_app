import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/modules/models/weather_info_model.dart';
import 'package:weather_app/modules/models/weather_params_model.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

/// WeatherModel data parsed from the API response (not used directly in the UI)
@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel({
    @JsonKey(name: 'main') required WeatherParamsModel weatherParams,
    @JsonKey(name: 'weather') required List<WeatherInfoModel> weatherInfo,
    required int dt,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
