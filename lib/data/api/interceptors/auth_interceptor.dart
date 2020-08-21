import 'dart:async';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String apiKey;

  // @override
  // FutureOr<void> before(RouteBase route) {
  //   if (route.metadataMap.containsKey('auth') &&
  //       route.metadataMap['auth'] == true &&
  //       apiKey != null) {
  //     route.header('Authorization', 'Token $apiKey');
  //   }
  //   return super.before(route);
  // }
  @override
  onRequest(RequestOptions options) async {
    Map<String, String> headers = new Map();
    headers["Authorization"] = 'Token $apiKey';

    options.headers = headers;
    return super.onRequest(options);
  }

  @override
  Future<dynamic> onResponse(Response options) async {
    if (options.headers.value("verifyToken") != null) {
      //if the header is present, then compare it with the Shared Prefs key
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // var verifyToken = prefs.get("VerifyToken");

      // if the value is the same as the header, continue with the request
      // if (options.headers.value("verifyToken") == verifyToken) {
      //   return options;
      // }
      return options;
    }
  }

  @override
  Future<dynamic> onError(DioError dioError) {
    return dioError.error;
  }
}
