import 'package:b13_flutter/features/authentication/pages/authentication/bloc/auth_page_state.dart';
import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:bloc/bloc.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit({AuthPageState initialState = const AuthPageState()})
      : super(initialState);

  changeSubPage({required AuthPageSubPage authPageSubPage}) {
    emit(state.copyWith(currentSubView: authPageSubPage));
  }
}
