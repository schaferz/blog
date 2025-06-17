import 'package:blog/auth/domain/entity/user.dart';
import 'package:blog/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

/// Authentikációt támogató repository.
class AuthRepository {
  /// Subapase kommunikációhoz kliens.
  final SupabaseClient _client;

  /// A bejelentkezett felhasználót tároló subject.
  final _userSubject = BehaviorSubject<User?>.seeded(null);

  /// A felhasználót elérhetővé tévő stream.
  Stream<User?> get user => _userSubject.stream;

  AuthRepository({required SupabaseClient client}) : _client = client;

  /// [SupabaseClient] alapján az aktuális auth session.
  Session? get session => _client.auth.currentSession;

  /// Vissza adja az aktuális, bejelentkezett felhasználót, azaz [User]-t vagy
  /// hiba esetén [Failure]-t.
  Future<Either<Failure, User>> getCurrentUser() async {
    if (session == null) {
      return left(const Failure(message: 'A felhasználó nincs bejelentkezve!'));
    }

    return right(User(id: session!.user.id, email: session!.user.email!));
  }

  /// Bejelentkezés adott felhasználóval ([email]) és jelszóval ([password]).
  ///
  /// Vissza adja siker esetén, a bejelentkezett felhasználót, egyébként a
  /// [Failure]-t.
  Future<Either<Failure, User>> signIn({required String email, required String password}) async {
    try {
      var response = await _client.auth.signInWithPassword(email: email, password: password);

      if (response.user == null) {
        left(const Failure(message: 'A user null'));
      }

      final User loggedInUser = User.fromJson(response.user!.toJson());

      _userSubject.add(loggedInUser);

      return right(loggedInUser);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  /// Kijelentkeztetés.
  Future<Either<Failure, void>> signOut() async {
    try {
      await _client.auth.signOut();

      _userSubject.add(null);

      return right(null);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
