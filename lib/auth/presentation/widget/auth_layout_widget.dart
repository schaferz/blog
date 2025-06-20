import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/auth/presentation/bloc/auth_state.dart';
import 'package:blog/auth/presentation/screen/login_screen.dart';
import 'package:blog/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Auth widget, mely ellenőrzi, hogy be van-e jelentkezve a felhasználó, ha nem, akkor a
/// bejelentkezés képernyőre irányít. Egyébként a [LayoutWidget]-et használja a kapott
/// paraméterekkel.
class AuthLayoutWidget extends StatelessWidget {
  /// Maximális szélesség desktop méretű képernyő esetén.
  final double maxDesktopContentWidth;

  /// Az elsődleges tartalom.
  final Widget main;

  /// Opcionális jobb oldali, összegző tartalom.
  final Widget? summary;

  const AuthLayoutWidget({
    super.key,
    required this.main,
    this.summary,
    this.maxDesktopContentWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (prev, current) => prev != current,
      builder: (_, state) {
        return state is AuthSuccess
            ? LayoutWidget(
                main: main,
                summary: summary,
                maxDesktopContentWidth: maxDesktopContentWidth,
              )
            : LoginScreen();
      },
    );
  }
}
