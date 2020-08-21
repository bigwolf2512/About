import 'package:b13_flutter/data/api/model/request/login_user_request.dart';
import 'package:b13_flutter/data/api/model/response/user_response.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:dio/dio.dart';
// import 'package:jaguar_retrofit/annotations/annotations.dart';
// import 'package:jaguar_retrofit/client/client.dart';
import 'package:dio/dio.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'model/request/login_user_request.dart';
import 'model/response/user_response.dart';
// part 'user_and_authentication_api.jretro.dart';

class UserAndAuthenticationApi {
  final Dio dio;
  @override
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  UserAndAuthenticationApi({
    this.dio,
    this.converters,
    this.timeout = const Duration(minutes: 2),
  });

  // @PostReq(path: '/users/login')
  @override
  Future<UserResponse> login(LoginUserRequest body) async {
    var user = {"email": body.email, "password": body.password};
    try {
      Response response = await dio.post('/create', data: user);
      // return response.data;
      return UserResponse(
          user: User(
              email: "email",
              username: "username",
              image: "5",
              token: "xxxxxx")); //dummydata
    } catch (error) {
      print(error);
    }
  }

  Future<UserResponse> getCurrentUser() async {
    Response baseUrl = await dio.get("/employees");
    //dummydata
    return UserResponse(
        user: User(
            email: "email", username: "username", image: "5", token: "xxxxxx"));
  }
}
