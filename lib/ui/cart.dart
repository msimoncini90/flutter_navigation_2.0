import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';
import 'package:navigation/router/b1routes.dart';

class Cart extends B1Page {
  const Cart(Map<String, dynamic> args) : super(args: args);

  @override
  Widget build(BuildContext context) {
    final appNav = BlocProvider.of<AppNavigator>(context);
    final items = args['cartItems'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Cart',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () {
                appNav.push(checkoutRoute, {'Pippo': 'Pippolino'});
              }),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
