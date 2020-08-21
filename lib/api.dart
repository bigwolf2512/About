import 'package:b13_flutter/data/api/model/request/login_user_request.dart';
import 'package:b13_flutter/data/api/model/response/user_response.dart';
import 'package:b13_flutter/data/api/user_and_authentication_api.dio.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:http/io_client.dart';
import 'package:dio/dio.dart';
import 'package:b13_flutter/data/api/interceptors/auth_interceptor.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'data/api/user_and_authentication_api.dio.dart';

final _jsonJaguarRepo = JsonRepo()
  ..add(UserSerializer())
  ..add(UserResponseSerializer())
  ..add(LoginUserRequestSerializer());

final Map<String, CodecRepo> defaultConverters = {
  MimeTypes.json: _jsonJaguarRepo,
};

class AppApi {
  String basePath = 'http://dummy.restapiexample.com/api/v1';
  Dio _dio = new Dio();
  final Duration timeout;
  final authInterceptor = AuthInterceptor();

  AppApi({
    String baseUrl,
    List<Interceptor> interceptors,
    this.timeout = const Duration(minutes: 2),
  }) {
    _dio.options.baseUrl = baseUrl;
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors);
    }
    // dio.interceptors.add(Interceptor(dio))
    // _baseRoute = Route(baseUrl ?? basePath)
    //     .withClient(globalClient ?? IOClient()) as Route;

    // _baseRoute.before(authInterceptor.before).after(authInterceptor.after);

    // for (var interceptor in interceptors) {
    //   _baseRoute.before(interceptor.before).after(interceptor.after);
    // }
  }

  void setApiKey(String name, String apiKey) {
    authInterceptor.apiKey = apiKey;
  }

  void removeApiKey(String name) {
    authInterceptor.apiKey = null;
  }

  UserAndAuthenticationApi getUserAndAuthenticationApi(
      {Dio dio, Map<String, CodecRepo> converters}) {
    dio ??= _dio;
    converters ??= defaultConverters;
    return UserAndAuthenticationApi(
        dio: _dio, converters: converters, timeout: timeout);
  }
}
