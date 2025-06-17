import 'package:blog/setting/setting.dart';
import 'package:flutter/foundation.dart';

/// Beállítás események közös őse.
@immutable
sealed class SettingEvent {
  const SettingEvent();
}

/// Beállítás előkészítése, adatok betöltése.
class SettingLoadEvent extends SettingEvent {
  const SettingLoadEvent();
}

/// Beállítások betöltve.
final class SettingLoaded extends SettingEvent {
  /// A betöltött beállítás adat.
  final Setting data;

  const SettingLoaded({required this.data});
}
