import 'package:b13_flutter/models/main_app_model.dart';
import 'package:b13_flutter/shared/widgets/popover/popover_controller.dart';
import 'package:b13_flutter/commands/base_command.dart' as Commands;
import 'package:b13_flutter/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:statsfl/statsfl.dart';

import 'core_packages.dart';

/// Wraps the entire app, providing it with various helper classes and wrapper widgets.
class MainAppScaffold extends StatefulWidget {
  const MainAppScaffold({Key? key, required this.child, this.useSafeArea = false}) : super(key: key);
  final Widget child;
  final bool useSafeArea;

  @override
  _MainAppScaffoldState createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffold> {
  @override
  Widget build(BuildContext context) {
    TextDirection textDirection = context.select((MainAppState app) => app.textDirection);
    // Provide the appTheme directly to the tree, so views don't need to look it up on the model (less boilerplate for views)
    AppTheme appTheme = context.select((MainAppState app) => app.theme);
    return Provider.value(
      value: appTheme,
      child: StatsFl(
        isEnabled: false && (kProfileMode || kDebugMode),
        align: Alignment.bottomCenter,
        child: Directionality(
          textDirection: textDirection,
          // Right-click support
          child: Navigator(
            onPopPage: (Route route, result) {
              if (route.didPop(result)) return true;
              return false;
            },
            pages: [
              MaterialPage(
                // Pop-over (tooltip) support
                  child: Builder(
                    builder: (BuildContext builderContext) {
                      Commands.setContext(builderContext);
                      return PopOverController(
                        // Draw a border around the entire window, because we're classy :)
                        child: _WindowBorder(
                          color: appTheme.greyStrong,
                          // Supply a top-level scaffold and SafeArea for all views
                          child: Scaffold(
                            backgroundColor: appTheme.surface1,
                            body: widget.useSafeArea ? SafeArea(
                              // AppBar + Content
                              // This column has a reversed vertical direction, because we want the TitleBar to cast a shadow on the content below it.
                              child: Column(
                                verticalDirection: VerticalDirection.up,
                                children: [
                                  // Bottom content area
                                  Expanded(
                                    child: widget.child,
                                  ),
                                ],
                              ),
                            ) : Column(
                              verticalDirection: VerticalDirection.up,
                              children: [
                                // Bottom content area
                                Expanded(
                                  child: widget.child,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _WindowBorder extends StatelessWidget {
  const _WindowBorder({Key? key,required this.child, this.color = Colors.white}) : super(key: key);
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color.withOpacity(.1), width: 1),
          ),
        ),
      ),
    ]);
  }
}
