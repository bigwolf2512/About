// import 'dart:html';

import 'package:b13_flutter/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'model/request/login_user_request.dart';
import 'model/response/user_response.dart';
// part 'user_and_authentication_api.jretro.dart';

class UserAndAuthenticationApi {
  final Response base;
  @override
  final Map<String, CodecRepo> converters;
  // Dio dio = Dio();
  Duration timeout = const Duration(minutes: 2);

  UserAndAuthenticationApi({
    this.base,
    this.converters,
    // this.dio,
    this.timeout,
  });

  @override
  Future<UserResponse> login(LoginUserRequest body) async {
    var user = {"email": body.email, "password": body.password};
    try {
      Response response = await Dio()
          .post('http://dummy.restapiexample.com/api/v1/create', data: user);
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
    Response baseUrl =
        await Dio().get("http://dummy.restapiexample.com/api/v1/employees");
    // return baseUrl.data;
    //dummydata
    return UserResponse(
        user: User(
            email: "email", username: "username", image: "5", token: "xxxxxx"));
  }
}
