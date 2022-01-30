import '../ui/cart.dart';
import '../ui/checkout.dart';
import '../ui/create_account.dart';
import '../ui/details.dart';
import '../ui/list_items.dart';
import '../ui/login.dart';
import '../ui/settings.dart';
import '../ui/splash.dart';

import './b1page.dart';
import './b1page_config.dart';

B1Page getB1Page(PageConfig config) {
  print('looking for ${config.route}');
  B1Page p = _routes[config.route]?.call(config.args) ?? Splash(config.args);
  // era un'altra pagina, notfoundpage
  print('found $p');
  return p;
}

Map<String, B1Page Function(Map<String, dynamic>)> _routes = {
  splashRoute: (args) => Splash(args),
  loginRoute: (args) => Login(args),
  createAccountRoute: (args) => CreateAccount(args),
  listItemsRoute: (args) => ListItems(args),
  detailsRoute: (args) => Details(args),
  cartRoute: (args) => Cart(args),
  checkoutRoute: (args) => Checkout(args),
  settingsRoute: (args) => Settings(args),
};

const splashRoute = '/';
const loginRoute = '/login';
const createAccountRoute = '/createAccount';
const listItemsRoute = '/listItems';
const detailsRoute = '/details';
const cartRoute = '/cart';
const checkoutRoute = '/checkout';
const settingsRoute = '/settings';
