import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';
import 'package:b13_flutter/shared/utils/safe_print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Converts browser location strings to [PageConfiguration], and vice-versa.
/// This leans on [PageConfiguration] to the actual parsing, so this is largely boilerplate.
class AppRouteParser extends RouteInformationParser<PageConfiguration> {
  @override
  // Take a url bar location, and create an AppLink from it
  Future<PageConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    PageConfiguration link = PageConfiguration.fromLocation(routeInformation.location ?? '');
    safePrint("parseRouteInfo: ${routeInformation.location} == ${link.location}");
    return link;
  }

  @override
  // Convert an applink into a string used for the browser location
  RouteInformation restoreRouteInformation(PageConfiguration appLink) {
    // Ask the applink to give us a string
    String location = appLink.location;
    safePrint("restoreRouteInfo: $location");

    // Pass that string back to the OS so it can update the url bar
    return RouteInformation(location: location);
  }
}
