import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/get_it/get_it.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();
