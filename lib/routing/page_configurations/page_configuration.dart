import 'package:b13_flutter/routing/page_configurations/auth_page_configuration.dart';
import 'package:b13_flutter/routing/page_configurations/home_page_configuration.dart';
import 'package:b13_flutter/routing/page_configurations/landing_page_configuration.dart';
import 'package:meta/meta.dart';

const String AuthPath = '/auth';
const String HomePath = '/home';
const String LandingPath = '/landing';
const String MealPath = '/meal';
const String MealDetailPath = '/meal/:id';
const String InventoryPath = '/inventory';
const String ShoppingPath = '/shopping';


enum Pages {
  Authenticate,
  Home,
  Landing,
  Meal,
  MealDetail,
  Inventory,
  Shopping,
}

abstract class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  get location => this.path;

  const PageConfiguration(
      {required this.key, required this.path, required this.uiPage});

  factory PageConfiguration.fromLocation(String location) {
    location = Uri.decodeFull(location);
    final parsedUri = Uri.parse(location);
    final pathSegments = parsedUri.pathSegments;
    if (pathSegments.isEmpty) {
      return LandingPageConfiguration.fromLocation(location);
    }
    final path = pathSegments[0];
    switch (path) {
      case AuthPath:
        return AuthPageConfiguration.fromLocation(location);
      case HomePath:
        return HomePageConfiguration.fromLocation(location);
      default:
        return LandingPageConfiguration.fromLocation(location);
    }
  }

  List<PageConfiguration> get pageTree => [this];
}
