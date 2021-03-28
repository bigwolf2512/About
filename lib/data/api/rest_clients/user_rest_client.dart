import 'package:b13_flutter/data/api/model/request/user/login_user_request.dart';
import 'package:b13_flutter/data/api/model/response/user/user_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'user_rest_client.g.dart';

@RestApi()
abstract class UserRestClient {
  factory UserRestClient(Dio dio, {String baseUrl}) = _UserRestClient;

  @POST("/login")
  Future<UserResponse> login(@Body() LoginUserRequest request);
}