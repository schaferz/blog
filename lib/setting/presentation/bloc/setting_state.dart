import 'package:blog/setting/data/entity/setting.dart';
import 'package:flutter/foundation.dart';

/// Beállítás közös állapot.
@immutable
class SettingState {
  const SettingState();
}

/// Beállítás kezdő állapot.
final class SettingInitial extends SettingState {
  const SettingInitial();
}

/// Beállítás betöltés alatt.
final class SettingLoading extends SettingState {
  const SettingLoading();
}

/// Beállítás betöltve, megfelelő, sikeres állapotban van.
final class SettingSuccess extends SettingState {
  /// A betöltött beállítás.
  final Setting setting;

  const SettingSuccess({required this.setting});
}

/// Sikertelen betöltés utáni állapot.
final class SettingFailure extends SettingState {
  /// A hiba részletei.
  final String message;

  /// A betöltött beállítás.
  final Setting? setting;

  const SettingFailure({required this.message, this.setting});
}
