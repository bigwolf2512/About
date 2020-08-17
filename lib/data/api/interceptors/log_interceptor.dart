import 'dart:async';

import 'package:dio/dio.dart';
// import 'package:jaguar_retrofit/jaguar_retrofit.dart';

class LogInterceptor extends InterceptorsWrapper {
  // @override
  // FutureOr<void> before(BaseOptions route) {
  //   print('AUTH HEADER: ${route.}');
  //   print('HEADERS: ${route.headers}');
  //   print('URL: ${route.baseUrl}');
  //   return route;
  // }

  // @override
  // FutureOr after(RequestOptions response) {
  //   print(response.toString());
  //   return Future.value(response);
  // }
  @override
  onRequest(RequestOptions options) {
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));

    if (options.data != null) {
      print("Body: ${options.data}");
    }
    // return options;
  }

  @override
  onError(DioError dioError) {
    dioError.response != null
        ? print(dioError.response.data)
        : print('Unknown Error');
  }

  @override
  onResponse(Response response) {
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
  }
}
