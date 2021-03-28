import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_page_state.freezed.dart';

@freezed
abstract class AuthPageState with _$AuthPageState {
  const factory AuthPageState({@Default(AuthPageSubPage.login) AuthPageSubPage currentSubView}) = _AuthPageState;
}