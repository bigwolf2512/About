import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';

class LandingPageConfiguration extends PageConfiguration {
  LandingPageConfiguration(): super(key: 'landing', path: LandingPath, uiPage: Pages.Landing);

  factory LandingPageConfiguration.fromLocation(String location){
    final config = LandingPageConfiguration();
    final uri = Uri.parse(location);
    final pathSegments = uri.pathSegments;
    return config;
  }
}