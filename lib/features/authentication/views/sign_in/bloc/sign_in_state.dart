import 'package:b13_flutter/data/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState() = _SignInState;

  const factory SignInState.loading() = Loading;

  const factory SignInState.success({required UserModel user}) = Success;

  const factory SignInState.error([String? error]) = Error;
}
