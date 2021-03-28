import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';

class HomePageConfiguration extends PageConfiguration {
  HomePageConfiguration()
      : super(key: 'home', path: HomePath, uiPage: Pages.Home);

  factory HomePageConfiguration.fromLocation(String location) {
    final config = HomePageConfiguration();
    final uri = Uri.parse(location);
    final pathSegments = uri.pathSegments;
    return config;
  }
}
