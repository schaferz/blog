import 'package:blog/auth/presentation/widget/auth_layout_widget.dart';
import 'package:flutter/material.dart';

/// Beállítások képernyő.
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayoutWidget(main: Text('Setting'));
  }
}
