import 'dart:async';

import 'package:dio/dio.dart';
// import 'package:jaguar_retrofit/jaguar_retrofit.dart';

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

  // @override
  // FutureOr after(StringResponse response) {
  //   return Future.value(response);
  // }
  @override
  onRequest(RequestOptions options) async {
    if (options.headers.containsKey("auth")) {
      //remove the auxiliary header
      options.headers.remove("auth");

      options.headers
          .addAll({"Authorization": "Authorization", "Token": 'Token $apiKey'});

      return options;
    }
  }
}
