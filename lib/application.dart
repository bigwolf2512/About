import 'package:b13_flutter/api.dart';
import 'package:b13_flutter/data/local_storage/user_local_storage.dart';
import 'package:b13_flutter/data/repositories/user_repository.dart';
import 'package:b13_flutter/data/api/interceptors/log_interceptor.dart';

class Config {}

class Application {
  late UserRepository userRepository;
  Config? config;

  late AppApi _api;

  Application({this.config});

  setup() async {
    _api = AppApi(interceptors: [
      LogInterceptor(),
    ]);
    await setupRepositories();
    final accessToken = userRepository.getAccessToken();
    _api.setApiKey(accessToken);
  }

  setupRepositories() async {
    final userApi = _api.getUserApiClient();
    final userStorage = UserLocalStorage();
    await userStorage.load();

    userRepository =
        UserRepository(api: _api, userApi: userApi, userStorage: userStorage);
  }
}
