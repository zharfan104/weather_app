// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherInfoModel _$$_WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    _$_WeatherInfoModel(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$_WeatherInfoModelToJson(_$_WeatherInfoModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
