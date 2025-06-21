import 'package:flutter/material.dart';

/// Alkalmazás útvonalak. Tartalmazza az útvonal konstansokat és a routing létrehozásáshoz a
/// [createAppRoutes] függvényt. Az egyes útvonalakhoz navigálást is biztosít (pl.: [pushMain]) vagy
/// útvonal alapján is képes erre a [pushByPath]-al.
class AppRoutes {
  /// Főoldal
  static final mainPath = '/';

  /// Blog
  static final blogPath = '/blog';

  /// User
  static final userPath = '/user';

  /// Setting
  static final settingPath = '/setting';

  /// Útvonalanként tárolja, hogy melyik navigációt biztosító függvénnyel kerülhetünk az adott
  /// oldalra.
  static Map<String, Function> navigationMap = {
    mainPath: (context) => pushMain(context),
    blogPath: (context) => pushBlog(context),
    userPath: (context) => pushUser(context),
    settingPath: (context) => pushSetting(context),
  };

  /// Útvonalanként az oldal elnevezése.
  static Map<String, String> routeNameMap = {
    mainPath: 'Főoldal',
    blogPath: 'Blog',
    userPath: 'Felhasználók',
    settingPath: 'Beállítások',
  };

  /// Navigáció a kapott útvonalra.
  static void pushByPath(BuildContext context, String path) {
    assert(navigationMap.containsKey(path));

    navigationMap[path]!(context);
  }

  /// Navigáció a főoldalra.
  static void pushMain(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(mainPath, (_) => false);
  }

  /// Navigáció a blog oldalra.
  static void pushBlog(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(blogPath, (_) => false);
  }

  /// Navigáció a felhasználók oldalra.
  static void pushUser(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(userPath, (_) => false);
  }

  /// Navigáció a beállítások oldalra.
  static void pushSetting(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(settingPath, (_) => false);
  }
}
