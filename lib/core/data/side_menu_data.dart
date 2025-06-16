import 'package:blog/core/model/ui/menu_model.dart';
import 'package:blog/core/route/app_routes.dart';
import 'package:flutter/material.dart';

/// Oldalsó menü adatait, elemeit tartalmazó osztály.
class SideMenuData {
  /// Kijelentkezés.
  static final String logout = 'logout';

  /// Oldalsó menü elemei.
  final menu = <MenuModel>[
    NavigationMenuModel(icon: Icons.home, text: 'Főoldal', path: AppRoutes.mainPath),
    NavigationMenuModel(icon: Icons.book, text: 'Blog', path: AppRoutes.blogPath),
    NavigationMenuModel(icon: Icons.person, text: 'Felhasználók', path: AppRoutes.userPath),
    NavigationMenuModel(icon: Icons.settings, text: 'Beállítások', path: AppRoutes.settingPath),
    MenuModel(name: logout, icon: Icons.logout, text: 'Kijelentkezés'),
  ];
}
