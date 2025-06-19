import 'package:blog/blog/presentation/screen/blog_screen.dart';
import 'package:blog/blog_user/presentation/screen/blog_user_screen.dart';
import 'package:blog/core/config/config.dart';
import 'package:blog/main/presentation/screen/main_screen.dart';
import 'package:blog/setting/presentation/screen/setting_screen.dart';
import 'package:flutter/material.dart';

/// Útvonalak előállításáért felelős osztály.
class RouterGenerator {
  /// Útvonalanként tárolja, hogy melyik navigációt biztosító függvénnyel kerülhetünk az adott
  /// oldalra.
  static Map<String, Function> navigationMap = {
    /// Útvonal előállításához map.
    ///
    /// Lásd [generateRoute].
    AppRoutes.mainPath: (settings) => MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return MainScreen();
      },
    ),
    AppRoutes.blogPath: (settings) => MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return BlogScreen();
      },
    ),
    AppRoutes.userPath: (settings) => MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return BlogUserScreen();
      },
    ),
    AppRoutes.settingPath: (settings) => MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return SettingScreen();
      },
    ),
  };

  /// Útvonal előállítása a [navigationMap] alapján.
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final route = navigationMap[setting.name];

    if (route == null) {
      throw Exception('Invalid route: ${setting.name}');
    }

    return route(setting);
  }
}
