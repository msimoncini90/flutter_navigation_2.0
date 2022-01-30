import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page_config.dart';

class ShoppingRouterDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfig> {
  final AppNavigator _appNavigator;

  ShoppingRouterDelegate(this._appNavigator) : navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocListener(
        //   listeners: [
        // _listenForBootstrapping(),
        // _listenForAuth(),
        // ],
        // child:
        // BlocConsumer<Appnavigator, NavigatorStack>(
        // builder: (context, stack) =>
        Navigator(
      // pages: stack.pages,
      pages: _appNavigator.state.pages,
      key: navigatorKey,
      onPopPage: (route, result) => _onPopPage.call(route, result),
      // ),
      // listener: (context, stack) {},
      // ),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (_appNavigator.canPop()) {
      _appNavigator.pop();
      return true;
    } else {
      return false;
    }
  }

  // BlocListener _listenForAuth() {
  //   return BlocListener<AppNavigator, NavigatorStack>(
  //     listener: (context, state) {
  //       if (_appNavigator.isLoggedIn) {
  //         _appNavigator.clearAndPush(listItemsRoute);
  //       } else {
  //         _appNavigator.clearAndPush(loginRoute);
  //       }
  //     },
  //   );
  // }

  @override
  Future<void> setNewRoutePath(PageConfig configuration) async {
    if (configuration.route != '/') {
      _appNavigator.clearAndPush(configuration.route, configuration.args);
    }

    return SynchronousFuture(null);
  }

  @override
  PageConfig? get currentConfiguration => _appNavigator.state.last;

  @override
  final GlobalKey<NavigatorState> navigatorKey;
}
