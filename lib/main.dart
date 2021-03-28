import 'dart:async';

import 'package:b13_flutter/commands/base_command.dart';
import 'package:b13_flutter/models/main_app_model.dart';
import 'package:b13_flutter/routing/app_route_parser.dart';
import 'package:b13_flutter/routing/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'commands/bootstrap_command.dart';

void main() async {
  //Call this first to make sure we can make other system level calls safely
  WidgetsFlutterBinding.ensureInitialized();
  // Status bar style on Android/iOS
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());

  if (kIsWeb) {
    // Increase Skia cache size to support bigger images.
    const int megabyte = 1000000;
    SystemChannels.skia
        .invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
    // TODO: cant' await on invokeMethod due to https://github.com/flutter/flutter/issues/77018  so awaiting on Future.delayed instead.
    await Future<void>.delayed(Duration.zero);
  }
  Application application = Application();
  await application.setup();

  /// Create core models & services
  MainAppState mainAppState =
      MainAppState(userRepository: application.userRepository);

  // /// Run
  runApp(MultiProvider(
    providers: [
      Provider.value(value: application.userRepository),
      // App Model - Stores data related to global settings or app modes
      ChangeNotifierProvider.value(value: mainAppState),
    ],
    child: _AppBootstrapper(),
  ));
  //
}

// Bootstrap the app, initializing all Controllers and Services
class _AppBootstrapper extends StatefulWidget {
  @override
  _AppBootstrapperState createState() => _AppBootstrapperState();
}

class _AppBootstrapperState extends State<_AppBootstrapper> {
  AppRouteParser routeParser = AppRouteParser();
  late AppRouterDelegate router;

  @override
  void initState() {
    // Create the appRouter, and inject it with the models/services it needs
    router = AppRouterDelegate(context.read<MainAppState>());
    // Run Bootstrap with scheduleMicrotask to avoid triggering any builds from init(), which would throw an error.
    scheduleMicrotask(() {
      // Bootstrap. This will initialize services, load saved data, determine initial navigation state and anything else that needs to get done at startup
      BootstrapCommand().run(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.select((MainAppState m) => m.theme);
    return MaterialApp.router(
      // Convert appState to (and from) a string "location"
      routeInformationParser: routeParser,
      // Builds a stack that represents your appState.
      routerDelegate: router,
      // Disable debug banner
      debugShowCheckedModeBanner: false,
      theme: theme.themeData,
    );
  }
}
