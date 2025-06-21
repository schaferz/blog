import 'package:flutter/material.dart';

/// Olyan page route, mely kikapcsolja az animációt, transition-t a képernyők közötti váltás során.
class NoTransitionPageRoute<T> extends MaterialPageRoute<T> {
  NoTransitionPageRoute({required super.builder});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 0);
}
