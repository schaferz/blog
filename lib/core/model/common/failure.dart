/// Általánosan használható, hibás választ reprezentáló osztály.
class Failure {
  /// Hiba szövege.
  final String message;

  const Failure({required this.message});

  @override
  String toString() {
    return 'Failure{message: $message}';
  }
}
