import 'package:flutter/material.dart';

/// Összegzésben megjelenített információt leíró modell.
class SummaryModel {
  /// A megjelenített ikon.
  final IconData icon;

  /// Az ikon színe.
  final Color color;

  /// Megjelenített érték.
  final String value;

  /// Az érték alatt szereplő magyarázó, leíró szöveg.
  final String title;

  const SummaryModel({
    required this.icon,
    required this.color,
    required this.value,
    required this.title,
  });
}
