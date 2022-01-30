import 'package:flutter/material.dart';

typedef TransitionAnimationBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
  Widget,
);

abstract class B1Page extends Page {
  final Map<String, dynamic> args;
  final int transitionDuration, reverseTransitionDuration; //millis

  final TransitionAnimationBuilder? animationBuilder;

  const B1Page({
    required this.args,
    this.transitionDuration = 400,
    this.reverseTransitionDuration = 400,
    this.animationBuilder,
  });

  Widget build(BuildContext context);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      transitionDuration: Duration(milliseconds: transitionDuration),
      reverseTransitionDuration:
          Duration(milliseconds: reverseTransitionDuration),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) =>
          animationBuilder?.call(
            context,
            animation,
            secondaryAnimation,
            child,
          ) ??
          _defaultAnimationBuilder(
            context,
            animation,
            secondaryAnimation,
            child,
          ),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> animation2,
      ) =>
          build(context),
    );
  }

  ///provide a default Transition for the app
  Widget _defaultAnimationBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.elasticIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
