// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/core/api/rest_client.dart' as _i4;
import 'package:weather_app/core/get_it/register_module.dart' as _i6;
import 'package:weather_app/modules/weather/repositories/weather_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.factory<_i4.RestClient>(
        () => registerModule.getServiceClient(gh<_i3.Dio>()));
    gh.singleton<_i5.WeatherRepository>(
        _i5.WeatherRepository(restClient: gh<_i4.RestClient>()));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}
