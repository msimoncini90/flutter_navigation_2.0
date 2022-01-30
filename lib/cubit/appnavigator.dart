import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../router/b1routes.dart';
import '../router/b1page.dart';
import '../router/b1page_config.dart';

part 'navigator_stack.dart';

class AppNavigator extends Cubit<NavigatorStack> {
  AppNavigator(
      /*List<PageConfig> initialPages*/
      )
      : super(NavigatorStack(
            /*initialPages*/
            ));

  void push(String path, [Map<String, dynamic>? args]) {
    print('push called with $path and $args');
    PageConfig config = PageConfig(location: path, args: args);
    emit(state.push(config));
  }

  void clearAndPush(String path, [Map<String, dynamic>? args]) {
    print('clearAndPush called with $path and $args');
    PageConfig config = PageConfig(location: path, args: args);
    emit(state.clearAndPush(config));
  }

  void pop() {
    emit(state.pop());
  }

  bool canPop() {
    return state.canPop();
  }

  // ! not related to navigation !
  bool isLoggedIn = false;
  bool splashFinished = false;
  final List<String> cartItems = [];
  void clearCart() {
    cartItems.clear();
  }

  Future<void> splashMethod() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (isLoggedIn) {
      clearAndPush(listItemsRoute);
    } else {
      clearAndPush(loginRoute);
    }
  }
}
