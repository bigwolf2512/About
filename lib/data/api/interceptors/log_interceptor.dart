import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class LogInterceptor extends Interceptor {
  @override
  Future onError(DioError err) async {
    print("""ERROR:
    URL: ${err.request.uri}
    Method: ${err.request.method} 
    Headers: ${json.encode(err.response.headers.map)}
        """);
    return super.onError(err);
  }

  @override
  Future onRequest(RequestOptions options) async {
    print("""REQUEST:
    ${onRequest(options)}
    """);
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    print("""RESPONSE:
    URL: ${response.request.uri}
    Method: ${response.request.method}
    Headers: ${json.encode(response.request.headers)}
    Data: ${json.encode(response.data)}
        """);
    return super.onResponse(response);
  }
}
