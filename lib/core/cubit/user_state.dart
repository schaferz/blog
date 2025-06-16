import 'package:blog/core/model/auth/user.dart';
import 'package:flutter/foundation.dart';

/// Felhasználó állapotokhoz közös ős.
@immutable
sealed class UserState {
  const UserState();
}

/// Felhasználó kezdő állapot.
final class UserInitial extends UserState {
  const UserInitial();
}

/// Felhasználó bejelentkezett állapot.
final class UserLoggedIn extends UserState {
  /// A bejelentkezett felhasználó.
  final User user;

  const UserLoggedIn({required this.user});
}
