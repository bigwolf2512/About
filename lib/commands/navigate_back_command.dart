import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';

import 'base_command.dart';

class NavigateBackCommand extends BaseAppCommand {
  Future<void> run() async {
    safePrint("NavigateBackCommand");
    if (mainAppState.currentPage.pageTree.length > 1) {
      mainAppState.currentPage = mainAppState
          .currentPage.pageTree[mainAppState.currentPage.pageTree.length - 2];
    }
  }
}
