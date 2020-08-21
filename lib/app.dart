import 'package:b13_flutter/application.dart';
import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/core/repositories/user/user_repository.dart';
import 'package:b13_flutter/localizations/app_localizations.dart';
import 'package:b13_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as prefix;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatelessWidget {
  final Application application;

  const MainApp({
    this.application,
  });

  @override
  Widget build(prefix.BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(
          value: application.userRepository,
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, UserState state) {
          return MaterialApp(
            locale: const Locale('en', ''),
            onGenerateTitle: (prefix.BuildContext context) =>
                AppLocalizations.of(context).appName,
            color: Colors.green,
            theme: ThemeData(primaryColor: Colors.green),
            localizationsDelegates: [
              const AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [const Locale('en')],
            onGenerateRoute: routes(application: application),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
