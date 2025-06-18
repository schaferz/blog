import 'package:blog/setting/setting.dart';
import 'package:flutter/foundation.dart';

/// Beállítás események közös őse.
@immutable
sealed class SettingEvent {
  const SettingEvent();
}

/// Beállítás előkészítése, adatok betöltése.
class SettingInitEvent extends SettingEvent {
  const SettingInitEvent();
}

/// Beállítások betöltve.
final class SettingLoadedEvent extends SettingEvent {
  /// A betöltött beállítás adat.
  final Setting data;

  const SettingLoadedEvent({required this.data});
}

/// Beállítás mentés esemény.
class SettingSaveEvent extends SettingEvent {
  /// A mentendő adat..
  final Setting data;

  const SettingSaveEvent({required this.data});
}
