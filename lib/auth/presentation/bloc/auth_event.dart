import 'package:flutter/foundation.dart';

/// Közös ős az Auth események számára.
@immutable
sealed class AuthEvent {
  const AuthEvent();
}

/// Bejelentkezés esemény.
final class AuthSignInEvent extends AuthEvent {
  /// Bejelentkezéshez e-mail cím.
  final String email;

  /// Bejelentkezéshez jelszó.
  final String password;

  const AuthSignInEvent({required this.email, required this.password});

  @override
  String toString() {
    return 'AuthSignInEvent{email: $email}';
  }
}

/// Aktuális, bejelentkezett felhasználó elérése esemény.
final class AuthCurrentUserEvent extends AuthEvent {
  const AuthCurrentUserEvent();
}
