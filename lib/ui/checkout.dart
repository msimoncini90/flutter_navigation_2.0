import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';
import 'package:navigation/router/b1routes.dart';

class Checkout extends B1Page {
  const Checkout(Map<String, dynamic> args) : super(args: args);

  @override
  Widget build(BuildContext context) {
    final appNav = BlocProvider.of<AppNavigator>(context);
    final items = appNav.cartItems;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // era replaceAll
                      appNav.clearAndPush(listItemsRoute);
                    },
                    child: const Text('Back To List'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      appNav.clearCart();
                      appNav.clearAndPush(listItemsRoute);
                    },
                    child: const Text('Clear Cart'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
