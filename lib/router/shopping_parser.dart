import 'package:flutter/material.dart';

import './b1page_config.dart';
import './b1routes.dart';

class ShoppingParser extends RouteInformationParser<PageConfig> {
  @override
  Future<PageConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final String path = routeInformation.location ?? splashRoute;
    PageConfig config = PageConfig(location: path);
    return config;
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(location: configuration.path.toString());
  }
}
