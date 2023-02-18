// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  @JsonKey(name: 'main')
  WeatherParamsModel get weatherParams => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<WeatherInfoModel> get weatherInfo => throw _privateConstructorUsedError;
  int get dt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'main') WeatherParamsModel weatherParams,
      @JsonKey(name: 'weather') List<WeatherInfoModel> weatherInfo,
      int dt});

  $WeatherParamsModelCopyWith<$Res> get weatherParams;
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherParams = null,
    Object? weatherInfo = null,
    Object? dt = null,
  }) {
    return _then(_value.copyWith(
      weatherParams: null == weatherParams
          ? _value.weatherParams
          : weatherParams // ignore: cast_nullable_to_non_nullable
              as WeatherParamsModel,
      weatherInfo: null == weatherInfo
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfoModel>,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherParamsModelCopyWith<$Res> get weatherParams {
    return $WeatherParamsModelCopyWith<$Res>(_value.weatherParams, (value) {
      return _then(_value.copyWith(weatherParams: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherModelCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$_WeatherModelCopyWith(
          _$_WeatherModel value, $Res Function(_$_WeatherModel) then) =
      __$$_WeatherModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'main') WeatherParamsModel weatherParams,
      @JsonKey(name: 'weather') List<WeatherInfoModel> weatherInfo,
      int dt});

  @override
  $WeatherParamsModelCopyWith<$Res> get weatherParams;
}

/// @nodoc
class __$$_WeatherModelCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$_WeatherModel>
    implements _$$_WeatherModelCopyWith<$Res> {
  __$$_WeatherModelCopyWithImpl(
      _$_WeatherModel _value, $Res Function(_$_WeatherModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherParams = null,
    Object? weatherInfo = null,
    Object? dt = null,
  }) {
    return _then(_$_WeatherModel(
      weatherParams: null == weatherParams
          ? _value.weatherParams
          : weatherParams // ignore: cast_nullable_to_non_nullable
              as WeatherParamsModel,
      weatherInfo: null == weatherInfo
          ? _value._weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfoModel>,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherModel implements _WeatherModel {
  _$_WeatherModel(
      {@JsonKey(name: 'main')
          required this.weatherParams,
      @JsonKey(name: 'weather')
          required final List<WeatherInfoModel> weatherInfo,
      required this.dt})
      : _weatherInfo = weatherInfo;

  factory _$_WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherModelFromJson(json);

  @override
  @JsonKey(name: 'main')
  final WeatherParamsModel weatherParams;
  final List<WeatherInfoModel> _weatherInfo;
  @override
  @JsonKey(name: 'weather')
  List<WeatherInfoModel> get weatherInfo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weatherInfo);
  }

  @override
  final int dt;

  @override
  String toString() {
    return 'WeatherModel(weatherParams: $weatherParams, weatherInfo: $weatherInfo, dt: $dt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherModel &&
            (identical(other.weatherParams, weatherParams) ||
                other.weatherParams == weatherParams) &&
            const DeepCollectionEquality()
                .equals(other._weatherInfo, _weatherInfo) &&
            (identical(other.dt, dt) || other.dt == dt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weatherParams,
      const DeepCollectionEquality().hash(_weatherInfo), dt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      __$$_WeatherModelCopyWithImpl<_$_WeatherModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherModelToJson(
      this,
    );
  }
}

abstract class _WeatherModel implements WeatherModel {
  factory _WeatherModel(
      {@JsonKey(name: 'main')
          required final WeatherParamsModel weatherParams,
      @JsonKey(name: 'weather')
          required final List<WeatherInfoModel> weatherInfo,
      required final int dt}) = _$_WeatherModel;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$_WeatherModel.fromJson;

  @override
  @JsonKey(name: 'main')
  WeatherParamsModel get weatherParams;
  @override
  @JsonKey(name: 'weather')
  List<WeatherInfoModel> get weatherInfo;
  @override
  int get dt;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}
