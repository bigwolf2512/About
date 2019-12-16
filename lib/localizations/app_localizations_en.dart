import 'dart:ui';

import 'package:b13_flutter/localizations/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizationsEN implements AppLocalizations {
  const AppLocalizationsEN();


  static Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(const AppLocalizationsEN());
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  AppLocalizationDelegate();

  @override
  String get appName => 'B13 Flutter';

  @override
  String get userSignIn => 'SignIn';

  @override
  String get userSignInFormEmail => 'Email';

  @override
  String get userSignInFormPassword => 'Password';

  @override
  String get userSignInFormSignIn => 'SignInForm';

  @override
  String get userSignInNoAccount => null;
}