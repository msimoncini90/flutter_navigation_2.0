import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';
import 'package:navigation/router/b1routes.dart';

class Settings extends B1Page {
  const Settings(Map<String, dynamic> args) : super(args: args);

  @override
  Widget build(BuildContext context) {
    final appNav = BlocProvider.of<AppNavigator>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // bloc.add(LogoutEvent());
                  appNav.isLoggedIn = false;
                  appNav.clearAndPush(loginRoute);
                },
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
