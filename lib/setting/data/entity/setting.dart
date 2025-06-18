import 'package:equatable/equatable.dart';

/// Beállítások entitás mely tárolja adott felhasználóhoz az alkalmazás megjelenését, működését
/// személyre szabó értékeket.
class Setting extends Equatable {
  /// Egyedi azonosító.
  final int? id;

  /// Felhasználót azonosító e-mail cím.
  final String email;

  /// Opcionális megjelenített név (ha nincs megadva az e-mail cím).
  final String? displayName;

  /// A használni kívánt téma.
  final String? theme;

  /// Akadály mentes mód aktív-e?
  final bool? accessibleMode;

  @override
  List<Object?> get props => [id, email, displayName, theme, accessibleMode];

  const Setting({this.id, required this.email, this.displayName, this.theme, this.accessibleMode});

  /// [Setting] létrehozása a kapott [json] alapján.
  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
    id: json['id'],
    email: json['email'],
    displayName: json['display_name'],
    theme: json['theme'],
    accessibleMode: json['accessible_mode'],
  );

  /// JSON létrehozása a kapott [Setting] alapján.
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'display_name': displayName,
    'theme': theme,
    'accessible_mode': accessibleMode,
  };
}
