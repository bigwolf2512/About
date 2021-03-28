import 'package:b13_flutter/api.dart';
import 'package:b13_flutter/data/api/model/request/user/login_user_request.dart';
import 'package:b13_flutter/data/api/rest_clients/user_rest_client.dart';
import 'package:b13_flutter/data/local_storage/user_local_storage.dart';
import 'package:b13_flutter/data/models/user/user_model.dart';
import 'package:b13_flutter/shared/helpers/event_emitter.dart';

class UserRepository extends EventEmitter {
  final AppApi api;
  final UserRestClient userApi;
  final UserLocalStorage userStorage;

  UserRepository({
    required this.api,
    required this.userApi,
    required this.userStorage,
  });

  Future<UserModel?> getCurrentUser() async {
    try {
      return null;
      //final result = await userApi.getCurrentUser();
      //return result.user;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> login(LoginUserRequest user) async {
    final userModel = UserModel(email: 'dsa@fmam.com', username: 'dsa', token: 'token');
    api.setApiKey(userModel.token);
    return UserModel(email: 'dsa@fmam.com', username: 'dsa', token: 'token');
    final result = await userApi.login(user);
    return UserModel(email: result.email, username: result.username, image: result.image, token: result.token);
  }

  Future logout() async {
    await setAccessToken('');
    api.setApiKey('');
  }

  Future<void> setAccessToken(String accessToken) async {
    userStorage.token = accessToken;
  }

  getAccessToken() {
    return userStorage.token;
  }

  isAuthenticated() {
    final token = getAccessToken();

    return token != null;
  }
}
