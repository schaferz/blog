import 'package:flutter/material.dart';

/// Responzív képernyő létrehozását támogató segédosztály.
class Responsive {
  /// Mobil méretű-e a képernyő?
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;

  /// Tablet méretű-e a képernyő?
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 750;

  /// Asztal méretű-e a képernyő?
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}