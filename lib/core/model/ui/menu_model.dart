import 'package:flutter/material.dart';

/// Alkalmazás menüjéhez modell mely meghatározza a megjelenítendő ikont és
/// szöveget.
class MenuModel {
  /// Opcionális név mely azonosítja a modellt.
  final String? name;

  /// A menünél megjelenő ikon.
  final IconData icon;

  /// A menüben megjelenített szöveg.
  final String text;

  /// Menü létrehozása ikonnal és szöveggel.
  const MenuModel({this.name, required this.icon, required this.text});

  @override
  String toString() {
    return 'MenuModel{text: $text}';
  }
}

/// Navigációt leíró menü modell mely tartalmazza az oldalt azonosító [path]-t.
class NavigationMenuModel extends MenuModel {
  /// Az útvonal melyre navigálni szükséges.
  final String path;

  NavigationMenuModel({super.name, required super.icon, required super.text, required this.path});
}
