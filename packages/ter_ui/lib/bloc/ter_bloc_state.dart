import 'package:flutter/foundation.dart';
import 'package:ter_ui/data/data.dart';

/// Általánosan használható, generic bloc state a tipikus felületi állapotok támogatásához.
@immutable
class TerBlocState {
  const TerBlocState();
}

/// Blog felhasználó kezdő állapot.
final class TerBlocInitial extends TerBlocState {
  const TerBlocInitial();
}

/// Blog felhasználó betöltés alatt.
final class TerBlocLoading extends TerBlocState {
  const TerBlocLoading();
}

/// Blog felhasználó betöltve, megfelelő, sikeres állapotban van.
final class TerBlocSuccess<T extends Model> extends TerBlocState {
  /// A betöltött Blog felhasználó.
  final List<T> data;

  const TerBlocSuccess(this.data);
}

/// Sikertelen betöltés utáni állapot.
final class TerBlocFailure<T extends Model> extends TerBlocState {
  /// A hiba részletei.
  final String error;

  /// A betöltött blog felhasználók.
  final List<T>? data;

  const TerBlocFailure({required this.error, this.data});
}