import 'package:b13_flutter/commands/navigate_to_command.dart';
import 'package:b13_flutter/commands/set_current_user_command.dart';
import 'package:b13_flutter/features/authentication/pages/authentication/bloc/auth_page_cubit.dart';
import 'package:b13_flutter/features/authentication/views/sign_in/bloc/sign_in_cubit.dart';
import 'package:b13_flutter/features/authentication/views/sign_in/bloc/sign_in_state.dart';
import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:b13_flutter/routing/page_configurations/home_page_configuration.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/rounded_loading_button.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignInFormState();
  }
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  String email = '';
  String password = '';
  late SignInCubit _signInCubit;

  @override
  void initState() {
    super.initState();
    _signInCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is Success) {
          SetCurrentUserCommand().run(state.user);
          NavigateToCommand().run(HomePageConfiguration());
        } else if (state is Loading) {
          _btnController.start();
        }
      },
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('email'),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Text('password'),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              RoundedLoadingButton(
                onPressed: _performLogin,
                animateOnTap: false,
              ),
              SimpleBtn(
                child: Text('Register'),
                onPressed: () {
                  context
                      .read<AuthPageCubit>()
                      .changeSubPage(authPageSubPage: AuthPageSubPage.register);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  _performLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      _signInCubit.login(email, password);
    }
  }
}
