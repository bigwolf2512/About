import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/data/api/model/login_user.dart';
import 'package:b13_flutter/localizations/app_localizations.dart';
import 'package:b13_flutter/shared/widgets/app_text_field_form.dart';
import 'package:b13_flutter/shared/widgets/error_container.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = LoginUser();
  UserBloc _userBloc;
  LoginUserValidator _validator;

  @override
  void initState() {
    super.initState();
    _validator = LoginUserValidator();
    _userBloc = BlocProvider.of<UserBloc>(context)..add(ClearUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return BlocListener<UserBloc, UserState>(
      listener: (BuildContext context, UserState state) {
        if (state is UserLoaded) {
          // Navigator.of(context).pushReplacementNamed(routeName)
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state is UserLoaded || state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          String error;
          if (state is UserError) {
            error = state.errors.join('\n\n');
          }
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                if (error != null)
                  ErrorContainer(
                    error: error,
                  ),
                const SizedBox(height: 16),
                createTextField(
                    hintText: locale.userSignInFormEmail,
                    autoValidate: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validator.validateEmail,
                    onSaved: (String value) {
                      setState(() {
                        _data.email = value;
                      });
                    }),
                const SizedBox(height: 16),
                createTextField(
                  hintText: locale.userSignInFormPassword,
                  obscureText: true,
                  autoValidate: false,
                  onChanged: (String value) {
                    _data.password = value;
                  },
                  validator: _validator.validatePassword,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedButton(
                    text: locale.userSignInFormSignIn,
                    onPressed: _signIn,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _userBloc.add(SignInEvent(_data));
    }
  }
}
