// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherParamsModel _$$_WeatherParamsModelFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherParamsModel(
      temp: (json['temp'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherParamsModelToJson(
        _$_WeatherParamsModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };
