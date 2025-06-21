import 'package:flutter/foundation.dart';
import 'package:ter_ui/data/data.dart';

/// Bloc állapotok.
enum TerBlocStatus {
  /// Alap kezdő állapot.
  initial,

  /// Betöltés alatt (pl. elindítottunk egy API hívást adatokért ami folyamatban van).
  loading,

  /// Sikeres állapot (pl. a betöltéssel minden rendben volt, megkaptuk az adatokat).
  success,

  /// Sikertelen állapot (pl. a betöltés közben hiba merült fel).
  failure,
}

/// Általánosan használható, generic bloc state a tipikus felületi állapotok támogatásához.
@immutable
class TerBlocState<T extends Model> {
  /// Amennyiben hiba merült fel, annak szövege amit a felületen is meg lehet jeleníteni.
  final String? error;

  /// A típus mellett egy állapot mezővel is jelöljük, hogy milyen állapotban van a bloc.
  final TerBlocStatus status;

  /// A betöltött adatok.
  final List<T>? data;

  const TerBlocState({this.error, required this.status, this.data});

  /// Kezdő állapot létrehozásához.
  ///
  /// Lásd [TerBlocStatus.initial].
  factory TerBlocState.initial() => const TerBlocState(status: TerBlocStatus.initial);

  /// Betöltés állapot létrehozásához.
  ///
  /// Lásd [TerBlocStatus.loading].
  factory TerBlocState.loading() => const TerBlocState(status: TerBlocStatus.loading);

  /// Hibás állapot létrehozásához.
  ///
  /// Lásd [TerBlocStatus.failure].
  factory TerBlocState.failure(String message) =>
      TerBlocState(status: TerBlocStatus.failure, error: message);

  /// Sikeres állapot létrehozásához.
  ///
  /// Lásd [TerBlocStatus.success].
  factory TerBlocState.success(List<T>? data) =>
      TerBlocState(status: TerBlocStatus.success, data: data);
}
