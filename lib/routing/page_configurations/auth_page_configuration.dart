import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';

enum AuthPageSubPage {
  login,
  register,
  forgotPassword,
  resetPassword,
}

const String LoginPath = 'login';
const String RegisterPath = 'register';
const String ForgotPasswordPath = 'forgot-password';
const String ResetPasswordPath = 'reset-password';

const pathMapping = {
  LoginPath: AuthPageSubPage.login,
  RegisterPath: AuthPageSubPage.register,
  ForgotPasswordPath: AuthPageSubPage.forgotPassword,
  ResetPasswordPath: AuthPageSubPage.resetPassword,

};

class AuthPageConfiguration extends PageConfiguration {
  late AuthPageSubPage subPage;

  AuthPageConfiguration({this.subPage = AuthPageSubPage.login})
      : super(key: 'auth', path: AuthPath, uiPage: Pages.Authenticate);

  factory AuthPageConfiguration.fromLocation(String location) {
    final config = AuthPageConfiguration();
    final uri = Uri.parse(location);
    final pathSegments = uri.pathSegments;
    final subPage = pathSegments.isEmpty || pathSegments.length == 1
        ? AuthPageSubPage.login
        : pathMapping[pathSegments[1]] ?? AuthPageSubPage.login;
    config.subPage = subPage;
    return config;
  }
}
