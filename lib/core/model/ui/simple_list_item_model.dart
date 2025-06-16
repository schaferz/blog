/// Egyszerű lista elem modell.
class SimpleListItemModel {
  /// Megjelenített, kiemelt cím.
  final String title;

  /// A cím alatt megjelenített magyarázó szöveg.
  final String description;

  const SimpleListItemModel({required this.title, required this.description});

  @override
  String toString() {
    return 'SimpleListItemModel{title: $title}';
  }
}
