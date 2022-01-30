import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';

import './router/router_delegate.dart';
import './router/shopping_parser.dart';
import './router/back_dispatcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ShoppingRouterDelegate delegate;
  late ShoppingParser parser;
  late ShoppingBackButtonDispatcher backButtonDispatcher;
  late AppNavigator _appNavigator;

  @override
  void initState() {
    super.initState();
    _appNavigator = AppNavigator();
    delegate = ShoppingRouterDelegate(_appNavigator);
    // delegate.setNewRoutePath(PageConfig(location: splashRoute));
    parser = ShoppingParser();
    backButtonDispatcher = ShoppingBackButtonDispatcher(delegate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _appNavigator,
      child: MaterialApp.router(
        title: 'Navigation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: delegate,
        routeInformationParser: parser,
        backButtonDispatcher: backButtonDispatcher,
      ),
    );
  }
}
