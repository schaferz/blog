import 'package:blog/core/model/auth/user.dart';
import 'package:blog/core/model/common/failure.dart';
import 'package:fpdart/fpdart.dart';

/// Authentikációt támogató repository.
abstract interface class AuthRepository {
  /// Vissza adja az aktuális, bejelentkezett felhasználót, azaz [User]-t vagy
  /// hiba esetén [Failure]-t.
  Future<Either<Failure, User>> getCurrentUser();

  /// Bejelentkezés adott felhasználóval ([email]) és jelszóval ([password]).
  ///
  /// Vissza adja siker esetén, a bejelentkezett felhasználót, egyébként a
  /// [Failure]-t.
  Future<Either<Failure, User>> signIn({required String email, required String password});

  /// Kijelentkeztetés.
  Future<Either<Failure, void>> signOut();
}
