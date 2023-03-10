import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          // baseUrl: Env.instance['backend_base_url'] ?? '',
          baseUrl: '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
  }

  CustomDio auth() => this;
  CustomDio unauth() => this;
}
