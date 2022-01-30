import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';

class Splash extends B1Page {
  const Splash(Map<String, dynamic> args) : super(args: args);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final size = query.size;
    final itemWidth = size.width;
    final itemHeight = itemWidth * (size.width / size.height);
    BlocProvider.of<AppNavigator>(context).splashMethod();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/splash.png',
            width: itemWidth,
            height: itemHeight,
          ),
        ),
      ),
    );
  }
}

class Pippo extends StatelessWidget {
  const Pippo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
