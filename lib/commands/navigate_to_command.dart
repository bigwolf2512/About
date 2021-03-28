
import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';

import 'base_command.dart';

class NavigateToCommand extends BaseAppCommand {
  Future<void> run(PageConfiguration pageConfiguration) async {
    safePrint("NavigateToCommand: $pageConfiguration");
    // Update appController with new user. If user is null, this acts as a logout command.
    mainAppState.currentPage = pageConfiguration;
  }
}
