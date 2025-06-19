/// UI modell interface, mely biztosítja, hogy a UI modell JSON-é alakítható. Ezen kívül minden
/// modell rendelkezik egy egyedi kulccsal.
abstract interface class Model {
  /// Visszaadja a modellt JSON formájában.
  ///
  /// Például:
  /// ```
  /// Map<String, dynamic> toJson() => {
  /// 	'id': id,
  /// 	'email': email,
  /// 	'name': name,
  /// 	}.filter((v) => v != null);
  /// ```
  Map<String, dynamic> toJson();

  /// A paraméterül kapott [data] JSON-ben lévő adatokat alkalmazva készít egy másolatot a
  /// modellről.
  Model copyWith(Map<String, dynamic> data);
}
