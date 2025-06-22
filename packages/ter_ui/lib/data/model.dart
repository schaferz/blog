/// Típus definició dinamikus JSON adathoz.
typedef JsonData = Map<String, dynamic>;

/// UI modell interface, mely biztosítja, hogy a UI modell JSON-é alakítható. Ezen kívül minden
/// modell rendelkezik egy egyedi kulccsal.
abstract interface class Model {
  /// Azonosító.
  final int? id;

  Model({required this.id});

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
  JsonData toJson();

  /// A paraméterül kapott [data] JSON-ben lévő adatokat alkalmazva készít egy másolatot a
  /// modellről.
  Model copyWith(JsonData data);
}
