part of 'appnavigator.dart';

class NavigatorStack extends Equatable {
  final List<PageConfig> _stack = [PageConfig(location: splashRoute)];

  NavigatorStack(
      // this._stack
      );

  List<B1Page> get pages => List.unmodifiable(_stack.map((e) => e.page));
  List<PageConfig> get configs => _stack;
  int get length => _stack.length;
  PageConfig get first => _stack.first;
  PageConfig get last => _stack.last;

  void clear() {
    _stack.removeRange(0, _stack.length - 2);
  }

  bool canPop() => _stack.length > 1;

  NavigatorStack pop() {
    if (canPop()) {
      _stack.remove(_stack.last);
    }
    return NavigatorStack();
  }

  NavigatorStack push(PageConfig config) {
    if (_stack.last != config) {
      _stack.add(config);
    }
    return NavigatorStack();
  }

  NavigatorStack clearAndPush(PageConfig config) {
    _stack.clear();
    _stack.add(config);
    return NavigatorStack();
  }

  @override
  List<Object> get props => [];
}
