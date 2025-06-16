import 'package:blog/main/presentation/screen/main_screen.dart';
import 'package:flutter/material.dart';

/// Alkalmazás útvonalak. Tartalmazza az útvonal konstansokat és a
/// routing létrehozásáshoz a [createAppRoutes] függvényt.
class AppRoutes {
  /// Főoldal
  static final mainPath = '/';

  /// Létrehozza az alkalmazás útvonalakat.
  static Map<String, WidgetBuilder> createAppRoutes() => {mainPath: (_) => const MainScreen()};
}
