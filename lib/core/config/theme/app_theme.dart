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

  /// Beviteli mezők háttérszín.
  static const inputBackgroundColor = Color(0xFF2F313E);

  /// Kijelölés színe.
  static const selectionColor = Color(0xFFD5D5D5);

  /// Hiba színe.
  static const errorColor = Colors.red;

  /// Alapértelmezett padding.
  static const defaultPadding = 20.0;

  /// Material [ThemeData] létrehozása, mely meghatározza az alkalmazás megjelenését.
  static ThemeData createThemeData(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.primaryColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppTheme.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppTheme.inputBackgroundColor,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor.withAlpha((255.0 * 0.7).round())),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (!states.contains(WidgetState.hovered)) {
              return AppTheme.primaryColor.withAlpha((255.0 * 0.8).round());
            } else {
              return AppTheme.primaryColor;
            }
          }),
          foregroundColor: WidgetStatePropertyAll(AppTheme.foregroundColor),
        ),
      ),
      // pageTransitionsTheme: PageTransitionsTheme(
      //   builders: kIsWeb
      //       ? {for (final platform in TargetPlatform.values) platform: const NoTransitionsBuilder()}
      //       : const {
      //           TargetPlatform.android: ZoomPageTransitionsBuilder(),
      //           TargetPlatform.windows: NoTransitionsBuilder(),
      //           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      //         },
      // ),
      cardTheme: CardThemeData(
        color: AppTheme.cardBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
