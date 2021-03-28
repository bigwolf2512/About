import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(apiKey != null && apiKey!.isNotEmpty) {
      Map<String, String> headers = new Map();
      headers["Authorization"] = 'Token $apiKey';

      options.headers = headers;
    }
    return super.onRequest(options, handler);
  }
}
