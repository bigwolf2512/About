import 'package:b13_flutter/routing/page_configurations/home_page_configuration.dart';
import 'package:b13_flutter/routing/page_configurations/page_configuration.dart';

class MealDetailPageConfiguration extends PageConfiguration {
  final String id;

  MealDetailPageConfiguration(this.id)
      : super(
            key: 'MealDetail', path: MealDetailPath, uiPage: Pages.MealDetail);

  factory MealDetailPageConfiguration.fromLocation(String location) {
    final uri = Uri.parse(location);
    final pathSegments = uri.pathSegments;
    final id = pathSegments[1];
    final config = MealDetailPageConfiguration(id);
    return config;
  }

  @override
  get location => this.path.replaceFirst(':id', this.id);

  @override
  List<PageConfiguration> get pageTree => [HomePageConfiguration(), this];
}
