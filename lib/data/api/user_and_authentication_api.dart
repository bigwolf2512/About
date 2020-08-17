import 'package:b13_flutter/data/api/model/request/login_user_request.dart';
import 'package:b13_flutter/data/api/model/response/user_response.dart';
// import 'package:dio/native_imp.dart';
import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/client/client.dart';
//  import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
part 'user_and_authentication_api.jretro.dart';

// @GenApiClient()
class UserAndAuthenticationApi extends ApiClient
    with _$UserAndAuthenticationApiClient {
  final Response baseUrl;
  @override
  final Map<String, CodecRepo> converters;
  Dio _dio;
  final Duration timeout;

  UserAndAuthenticationApi({
    this.baseUrl,
    this.converters,
    this.timeout = const Duration(minutes: 2),
  });

  // @PostReq(path: '/users/login')
  // @override
  // Future<UserResponse> login(@AsJson() LoginUserRequest body) {
  //   return super.login(body).timeout(timeout);
  // }
  // @override
  // Future<UserResponse> login(LoginUserRequest body) async {
  //   Response baseUrl = await dio.post("/test", data: body);
  //   return baseUrl.data;
  // }
  @override
  Future<UserResponse> login(LoginUserRequest body) async {
    Response baseUrl = await _dio.post("/users/login", data: body);
    return baseUrl.data;
  }

  // @GetReq(
  //   path: '/user',
  //   metadata: {(
  //     'auth': true,
  //   },
  // )
  // @override
  // Future<UserResponse> getCurrentUser() {
  //   return super.getCurrentUser().timeout(timeout);
  // }

  Future<UserResponse> getCurrentUser() async {
    Response baseUrl = await _dio.get("/user");
    return baseUrl.data;
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
