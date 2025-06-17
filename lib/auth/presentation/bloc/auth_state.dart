import 'package:blog/auth/auth.dart';
import 'package:flutter/foundation.dart';

/// Közös ős a különböző Auth állapotokhoz.
@immutable
sealed class AuthState {
  const AuthState();
}

/// Auth kezdő állapot.
final class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Auth betöltés alatt.
final class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Sikeres bejelentkezés utáni állapot.
final class AuthSuccess extends AuthState {
  /// A bejelentkezett felhasználó.
  final User user;

  const AuthSuccess({required this.user});
}

/// Sikertelen bejelentkezés utáni állapot.
final class AuthFailure extends AuthState {
  /// A hiba részletei.
  final String message;

  const AuthFailure({required this.message});
}
