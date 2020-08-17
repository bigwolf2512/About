import 'package:b13_flutter/data/api/model/request/login_user_request.dart';
import 'package:b13_flutter/data/api/model/response/user_response.dart';
import 'package:b13_flutter/data/api/user_and_authentication_api.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:http/io_client.dart';

import 'package:b13_flutter/data/api/interceptors/auth_interceptor.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
// import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

final _jsonJaguarRepo = JsonRepo()
  ..add(UserSerializer())
  ..add(UserResponseSerializer())
  ..add(LoginUserRequestSerializer());

final Map<String, CodecRepo> defaultConverters = {
  MimeTypes.json: _jsonJaguarRepo,
};

class AppApi {
  String basePath = 'localhost:8080/api';
  Response _baseRoute;
  final Duration timeout;
  final authInterceptor = AuthInterceptor();
  Dio _dio;
  AppApi({
    String baseUrl,
    Dio dio,
    List<Interceptor> interceptors,
    this.timeout = const Duration(minutes: 2),
  }) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = timeout.inMinutes
      ..httpClientAdapter;
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  void setApiKey(String name, String apiKey) {
    authInterceptor.apiKey = apiKey;
  }

  void removeApiKey(String name) {
    authInterceptor.apiKey = null;
  }

  UserAndAuthenticationApi getUserAndAuthenticationApi(
      {Response base, Map<String, CodecRepo> converters}) {
    base ??= _baseRoute;
    converters ??= defaultConverters;
    return UserAndAuthenticationApi(
        baseUrl: base, converters: converters, timeout: timeout);
  }
}
