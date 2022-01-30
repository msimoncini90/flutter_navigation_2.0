import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';
import 'package:navigation/router/b1routes.dart';

class CreateAccount extends B1Page {
  CreateAccount(Map<String, dynamic> args) : super(args: args);

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appNav = BlocProvider.of<AppNavigator>(context);
    return BlocBuilder<AppNavigator, NavigatorStack>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.lightBlue,
            title: const Text(
              'Create Account',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Email'),
                                onChanged: (email) {
                                  // bloc.add(EmailChanged(email: email));
                                },
                                controller: emailTextController),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                enableSuggestions: false,
                                autocorrect: false,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Password'),
                                onChanged: (password) {
                                  // bloc.add(PasswordChanged(password: password));
                                },
                                controller: passwordTextController),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0)),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            onPressed: () {
                              // bloc.add(LoginEvent());
                              appNav.clearAndPush(listItemsRoute);
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              side: const BorderSide(color: Colors.black),
                            ),
                            onPressed: () {
                              // bloc.add(
                              //   CurrentActionChanged(
                              //     currentAction:
                              //         PageAction(state: PageState.pop),
                              //   ),
                              // );
                              appNav.pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
