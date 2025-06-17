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
