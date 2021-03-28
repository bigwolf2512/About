import 'package:b13_flutter/data/api/rest_clients/user_rest_client.dart';
import 'package:dio/dio.dart';
import 'package:b13_flutter/data/api/interceptors/auth_interceptor.dart';

class AppApi {
  static const String basePath = 'http://dummy.restapiexample.com/api/v1';
  Dio _dio = Dio();
  final Duration timeout;
  final authInterceptor = AuthInterceptor();

  AppApi({
    String baseUrl = basePath,
    List<Interceptor> interceptors = const [],
    this.timeout = const Duration(minutes: 2),
  }) {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(authInterceptor);
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  void setApiKey(String apiKey) {
    authInterceptor.apiKey = apiKey;
  }

  void removeApiKey() {
    authInterceptor.apiKey = '';
  }

  UserRestClient getUserApiClient({Dio? dio}) {
    dio ??= _dio;
    return UserRestClient(dio);
  }
}
