import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/rest_client.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();

  RestClient getServiceClient(Dio dio) => RestClient(dio);
}
