import 'package:blog/core/model/menu_model.dart';
import 'package:flutter/material.dart';

/// Oldalsó menü adatait, elemeit tartalmazó osztály.
class SideMenuData {

  /// Oldalsó menü elemei.
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, text: 'Főoldal'),
    MenuModel(icon: Icons.book, text: 'Blog'),
    MenuModel(icon: Icons.person, text: 'Felhasználók'),
    MenuModel(icon: Icons.settings, text: 'Beállítások'),
    MenuModel(icon: Icons.logout, text: 'Kijelentkezés'),
  ];
}