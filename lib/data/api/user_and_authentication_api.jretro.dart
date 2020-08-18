// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user_and_authentication_api.dio.dart';

// // // **************************************************************************
// // // JaguarHttpGenerator
// // // **************************************************************************

// abstract class _$UserAndAuthenticationApiClient implements ApiClient {
//   final String basePath = "";
//   Future<UserResponse> login(LoginUserRequest body) async {
//     var req = base.body
//         .path(basePath)
//         .path("/users/login")
//         .json(jsonConverter.to(body));
//     return req.go(throwOnErr: true).map(decodeOne);
//   }

//   Future<UserResponse> getCurrentUser() async {
//     var req = base.body
//         ..metadata({
//           "auth": true,
//         })
//         ..path(basePath)
//         ..path("/user");
//     return req.go(throwOnErr: true).map(decodeOne);
//   }
// }
