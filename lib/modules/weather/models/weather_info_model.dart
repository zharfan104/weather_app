import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info_model.g.dart';
part 'weather_info_model.freezed.dart';

@freezed
class WeatherInfoModel with _$WeatherInfoModel {
  factory WeatherInfoModel({
    required String main,
    required String description,
    required String icon,
  }) = _WeatherInfoModel;

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoModelFromJson(json);
}
