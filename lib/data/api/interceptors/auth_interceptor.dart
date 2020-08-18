import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:jaguar_retrofit/jaguar_retrofit.dart';

class AuthInterceptor extends Interceptors {
  String apiKey;

  var _dio = Dio();
  @override
  FutureOr<Response> onRequest(BaseOptions options) async {
    _dio.options = options;
    if (options.headers.containsKey("auth") && apiKey != null) {
      //remove the auxiliary header
      options.headers.remove("auth");

      options.headers
          .addAll({"Authorization": "Authorization", "Token": 'Token $apiKey'});
    }
    return _dio.resolve(options);
  }

  @override
  FutureOr<dynamic> onError(DioError dioError) {
    print(dioError);
  }

  @override
  FutureOr<dynamic> onResponse(Response options) async {
    if (options.headers.value("Token") != null) {
      //if the header is present, then compare it with the Shared Prefs key
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var verifyToken = prefs.get("Token");

      // if the value is the same as the header, continue with the request
      if (options.headers.value("Token") == verifyToken) {
        return options;
      }
    }
  }
}
