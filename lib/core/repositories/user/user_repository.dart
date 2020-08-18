import 'package:b13_flutter/api.dart';
import 'package:b13_flutter/data/api/model/login_user.dart';
import 'package:b13_flutter/data/api/model/request/login_user_request.dart';
import 'package:b13_flutter/data/api/user_and_authentication_api.dio.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/data/shared_preference/user_shared_preference.dart';
import 'package:b13_flutter/shared/helpers/event_emitter.dart';

class UserRepository extends EventEmitter {
  final AppApi api;
  final UserAndAuthenticationApi userApi;
  final UserSharedPreference userStorage;

  UserRepository({
    this.api,
    this.userApi,
    this.userStorage,
  });

  Future<User> getCurrentUser() async {
    final result = await userApi.getCurrentUser();
    return result.user;
  }

  Future<User> login(LoginUser user) async {
    final result = await userApi.login(LoginUserRequest(user: user));
    print(result.user);
    return result.user;
  }

  Future<void> setAccessToken(String accessToken) async {
    await userStorage.setToken(accessToken);
  }

  Future<String> getAccessToken() async {
    final token = userStorage.token;

    if (token == null) return null;

    return token;
  }

  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();

    return token != null;
  }

  Future<void> removeAccessToken() async {
    api.setApiKey('Token', null);

    return userStorage.setToken(null);
  }
}
