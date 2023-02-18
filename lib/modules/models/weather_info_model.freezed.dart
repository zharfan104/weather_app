// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) {
  return _WeatherInfoModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherInfoModel {
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherInfoModelCopyWith<WeatherInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInfoModelCopyWith<$Res> {
  factory $WeatherInfoModelCopyWith(
          WeatherInfoModel value, $Res Function(WeatherInfoModel) then) =
      _$WeatherInfoModelCopyWithImpl<$Res, WeatherInfoModel>;
  @useResult
  $Res call({String main, String description, String icon});
}

/// @nodoc
class _$WeatherInfoModelCopyWithImpl<$Res, $Val extends WeatherInfoModel>
    implements $WeatherInfoModelCopyWith<$Res> {
  _$WeatherInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherInfoModelCopyWith<$Res>
    implements $WeatherInfoModelCopyWith<$Res> {
  factory _$$_WeatherInfoModelCopyWith(
          _$_WeatherInfoModel value, $Res Function(_$_WeatherInfoModel) then) =
      __$$_WeatherInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String main, String description, String icon});
}

/// @nodoc
class __$$_WeatherInfoModelCopyWithImpl<$Res>
    extends _$WeatherInfoModelCopyWithImpl<$Res, _$_WeatherInfoModel>
    implements _$$_WeatherInfoModelCopyWith<$Res> {
  __$$_WeatherInfoModelCopyWithImpl(
      _$_WeatherInfoModel _value, $Res Function(_$_WeatherInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_$_WeatherInfoModel(
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherInfoModel implements _WeatherInfoModel {
  _$_WeatherInfoModel(
      {required this.main, required this.description, required this.icon});

  factory _$_WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherInfoModelFromJson(json);

  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherInfoModel(main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherInfoModel &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, main, description, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherInfoModelCopyWith<_$_WeatherInfoModel> get copyWith =>
      __$$_WeatherInfoModelCopyWithImpl<_$_WeatherInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherInfoModelToJson(
      this,
    );
  }
}

abstract class _WeatherInfoModel implements WeatherInfoModel {
  factory _WeatherInfoModel(
      {required final String main,
      required final String description,
      required final String icon}) = _$_WeatherInfoModel;

  factory _WeatherInfoModel.fromJson(Map<String, dynamic> json) =
      _$_WeatherInfoModel.fromJson;

  @override
  String get main;
  @override
  String get description;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherInfoModelCopyWith<_$_WeatherInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
