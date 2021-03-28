import 'package:b13_flutter/data/api/model/request/user/login_user_request.dart';
import 'package:b13_flutter/data/repositories/user_repository.dart';
import 'package:b13_flutter/features/authentication/views/sign_in/bloc/sign_in_state.dart';
import 'package:bloc/bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final UserRepository userRepository;
  SignInCubit({required this.userRepository}) : super(SignInState());
  login(String username, String password) async {
    emit(SignInState.loading());
    final user = await userRepository.login(LoginUserRequest(email: 'dsa@gmail.com', password: '123'));
    emit(SignInState.success(user: user));
  }
}