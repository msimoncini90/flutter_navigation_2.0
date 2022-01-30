import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/appnavigator.dart';
import 'package:navigation/router/b1page.dart';
import 'package:navigation/router/b1routes.dart';
import './details.dart';

class ListItems extends B1Page {
  const ListItems(Map<String, dynamic> args) : super(args: args);

  @override
  Widget build(BuildContext context) {
    final appNav = BlocProvider.of<AppNavigator>(context);
    final items = List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Items for sale',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                appNav.push(settingsRoute);
              }),
          IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: () {
                appNav.push(checkoutRoute);
              })
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                appNav.push(detailsRoute, {'id': index});
              },
            );
          },
        ),
      ),
    );
  }
}
