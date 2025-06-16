import "package:flutter/material.dart";

/// Az alkalmazás által használt szín és megjelenést meghatározó konstansok.
abstract class AppTheme {
  /// Elsődleges szín.
  static const primaryColor = Color(0xFF2697FF);

  /// Másodlagos szín.
  static const secondaryColor = Color(0xFFFFFFFF);

  /// Háttérszín.
  static const backgroundColor = Color(0xFF15131C);

  /// Előtér színe.
  static const foregroundColor = Color(0xFFFFFFFF);

  /// Kártya háttérszín.
  static const cardBackgroundColor = Color(0xFF21222D);

  /// Kijelölés színe.
  static const selectionColor = Color(0xFFD5D5D5);

  /// Hiba színe.
  static const errorColor = Colors.red;

  /// Alapértelmezett padding.
  static const defaultPadding = 20.0;
}
