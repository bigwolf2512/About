import 'package:b13_flutter/features/home/screen/home.dart';
import 'package:b13_flutter/features/login/widget/signin_form.dart';
import 'package:b13_flutter/layout.dart';
import 'package:b13_flutter/localizations/app_localizations.dart';
import 'package:b13_flutter/shared/widgets/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in';

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Layout(
      child: ScrollPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: <Widget>[
                  Text(
                    locale.userSignIn,
                    style: theme.textTheme.title.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.route);
                    },
                    child: Text(
                      'Home',
                      style: theme.textTheme.subtitle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SignInForm(),
            ),
          ],
        ),
      ),
    );
  }
}
