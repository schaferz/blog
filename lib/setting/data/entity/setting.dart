import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ter_ui/ter_ui.dart';

/// Beállítások entitás mely tárolja adott felhasználóhoz az alkalmazás megjelenését, működését
/// személyre szabó értékeket.
class Setting extends Equatable implements Model {
  /// Egyedi azonosító.
  @override
  final int? id;

  /// Felhasználót azonosító e-mail cím.
  final String email;

  /// Opcionális megjelenített név (ha nincs megadva az e-mail cím).
  final String? displayName;

  /// A használni kívánt téma.
  final String? theme;

  /// Akadály mentes mód aktív-e?
  final bool? accessibleMode;

  const Setting({this.id, required this.email, this.displayName, this.theme, this.accessibleMode});

  @override
  List<Object?> get props => [id, email, displayName, theme, accessibleMode];

  /// JSON létrehozása a kapott [Setting] alapján.
  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'display_name': displayName,
    'theme': theme,
    'accessible_mode': accessibleMode,
  }.filter((v) => v != null);

  @override
  Setting copyWith(Map<String, dynamic> data) {
    return Setting(
      id: data['id'] ?? id,
      email: data['email'] ?? email,
      displayName: data['display_name'] ?? displayName,
      theme: data['theme'] ?? theme,
      accessibleMode: data['accessible_mode'] ?? accessibleMode,
    );
  }

  /// [Setting] létrehozása a kapott [json] alapján.
  factory Setting.fromJson(Map<String, dynamic> json) => Setting(email: '').copyWith(json);
}
