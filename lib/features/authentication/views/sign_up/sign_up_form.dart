import 'package:b13_flutter/features/authentication/pages/authentication/bloc/auth_page_cubit.dart';
import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:b13_flutter/shared/styled_widgets/buttons/styled_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SimpleBtn(child: Text('Login'), onPressed: (){
            context
                .read<AuthPageCubit>()
                .changeSubPage(authPageSubPage: AuthPageSubPage.login);
          },)
        ],
      ),
    );
  }
}
