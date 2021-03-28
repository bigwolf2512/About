import 'package:b13_flutter/commands/navigate_to_command.dart';
import 'package:b13_flutter/data/repositories/user_repository.dart';
import 'package:b13_flutter/features/authentication/pages/authentication/bloc/auth_page_cubit.dart';
import 'package:b13_flutter/features/authentication/pages/authentication/bloc/auth_page_state.dart';
import 'package:b13_flutter/features/authentication/views/forgot_password/forgot_password_form.dart';
import 'package:b13_flutter/features/authentication/views/reset_password/reset_password_form.dart';
import 'package:b13_flutter/features/authentication/views/sign_in/bloc/sign_in_cubit.dart';
import 'package:b13_flutter/features/authentication/views/sign_in/sign_in_form.dart';
import 'package:b13_flutter/features/authentication/views/sign_up/sign_up_form.dart';
import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:b13_flutter/routing/page_configurations/home_page_configuration.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  late AuthPageCubit authPageCubit;

  @override
  void initState() {
    authPageCubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.deepPurpleAccent,
          ),
          SizedBox(height: 10,),
          BlocBuilder<AuthPageCubit, AuthPageState>(builder: (context, state) {
            return _authTitle(state);
          }),
          Expanded(
            child: BlocBuilder<AuthPageCubit, AuthPageState>(
                builder: (context, state) {
              return _authSubView(state);
            }),
          ),
        ],
      ),
    );
  }

  Widget _authTitle(AuthPageState state) {
    String title = 'Sign In';
    switch (state.currentSubView) {
      case AuthPageSubPage.login:
        title = 'Sign In';
        break;
      case AuthPageSubPage.register:
        title = 'Sign Up';
        break;
      case AuthPageSubPage.resetPassword:
        title = 'Reset Password';
        break;
      case AuthPageSubPage.forgotPassword:
        title = 'Forgot Password';
        break;
    }
    return Container(
      child: Text(title),
    );
  }

  Widget _authSubView(AuthPageState state) {
    switch (state.currentSubView) {
      case AuthPageSubPage.login:
        return _signInSubView();
      case AuthPageSubPage.register:
        return SignUpForm();
      case AuthPageSubPage.resetPassword:
        return ResetPasswordForm();
      case AuthPageSubPage.forgotPassword:
        return ForgotPasswordForm();
    }
    return Container();
  }

  Widget _signInSubView() {
    return BlocProvider<SignInCubit>(
      create: (context) {
        return SignInCubit(userRepository: context.read<UserRepository>());
      },
      child: SignInForm(),
    );
  }
}
