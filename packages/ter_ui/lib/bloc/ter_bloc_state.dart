import 'package:flutter/foundation.dart';
import 'package:ter_ui/data/data.dart';

/// Általánosan használható, generic bloc state a tipikus felületi állapotok támogatásához.
@immutable
class TerState {
  const TerState();
}

/// Blog felhasználó kezdő állapot.
final class TerStateInitial extends TerState {
  const TerStateInitial();
}

/// Blog felhasználó betöltés alatt.
final class TerStateLoading extends TerState {
  const TerStateLoading();
}

/// Blog felhasználó betöltve, megfelelő, sikeres állapotban van.
final class TerStateSuccess<T extends Model> extends TerState {
  /// A betöltött Blog felhasználó.
  final List<T> data;

  const TerStateSuccess(this.data);
}

/// Sikertelen betöltés utáni állapot.
final class TerStateFailure<T extends Model> extends TerState {
  /// A hiba részletei.
  final String error;

  /// A betöltött blog felhasználók.
  final List<T>? data;

  const TerStateFailure({required this.error, this.data});
}