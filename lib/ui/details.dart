import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';
import 'package:navigation/router/b1routes.dart';

class Details extends B1Page {
  const Details(Map<String, dynamic> args) : super(args: args);

  @override
  Widget build(BuildContext context) {
    final appNav = BlocProvider.of<AppNavigator>(context);
    final int id = args['id'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Item $id',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // bloc.add(AddToCart(item: 'Item $id'));
                  // bloc.add(CurrentActionChanged(
                  //     currentAction: PageAction(
                  //   state: PageState.pop,
                  // )));
                  appNav.cartItems.add('Item $id');
                  appNav.pop();
                },
                child: const Text('Add to Cart'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  appNav.push(cartRoute);
                },
                child: const Text('Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
