import 'package:blog/core/core.dart';
import 'package:flutter/material.dart';

/// Összegzés alapadatok.
class SummaryData {
  /// Ez alapján jelennek meg a felületen az összegző dobozok.
  final healthData = const [
    SummaryModel(icon: Icons.notifications, color: Colors.orange, value: "3", title: "Értesítések"),
    SummaryModel(
      icon: Icons.notification_important,
      color: Colors.red,
      value: "1",
      title: "Riasztások",
    ),
    SummaryModel(icon: Icons.message, color: Colors.blue, value: "2", title: "Üzenetek"),
    SummaryModel(icon: Icons.person, color: Colors.green, value: "10", title: "Felhasználók"),
  ];
}
