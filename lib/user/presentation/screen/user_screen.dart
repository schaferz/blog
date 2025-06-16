import 'package:blog/auth/presentation/widget/auth_layout_widget.dart';
import 'package:flutter/material.dart';

/// Felhasználók képernyő.
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayoutWidget(main: Text('User'));
  }
}
