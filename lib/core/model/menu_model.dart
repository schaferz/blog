import 'package:flutter/material.dart';

/// Alkalmazás menüjéhez modell mely meghatározza a megjelenítendő ikont és
/// szöveget.
class MenuModel {
  /// A menünél megjelenő ikon.
  final IconData icon;

  /// A menüben megjelenített szöveg.
  final String text;

  /// Menü létrehozása ikonnal és szöveggel.
  const MenuModel({required this.icon, required this.text});

  @override
  String toString() {
    return 'MenuModel{text: $text}';
  }
}
