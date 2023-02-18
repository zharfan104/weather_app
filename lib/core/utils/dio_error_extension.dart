import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/string_extension.dart';

extension DioErrorExtension on DioError {
  // ignore: avoid_as, avoid_dynamic_calls
  String get errorMessage => (response?.data?['message'] as String?) ?? message;
  String get capitalizeErrorMessage => errorMessage.capitalize();
}
