import 'package:flutter/widgets.dart';

/// Képernyő típusok.
enum ScreenType {
  /// Mobil méretű képernyő.
  mobile,

  /// Tablet méretű képernyő.
  tablet,

  /// Asztal méretű képernyő.
  desktop,
}

/// [ScreenType.tablet] és [ScreenType.desktop] lista.
List<ScreenType> get tabletDesktop => [ScreenType.desktop, ScreenType.tablet];

/// Responzív képernyő létrehozását támogató segédosztály.
class Responsive {
  /// Mobil méretű-e a képernyő?
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 750;

  /// Tablet méretű-e a képernyő?
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 750;

  /// Asztal méretű-e a képernyő?
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  /// Visszaadja a képernyő méretnek megfelelő típust.
  static ScreenType getScreenType(BuildContext context) {
    if (isMobile(context)) {
      return ScreenType.mobile;
    } else if (isTablet(context)) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}
