import 'package:blog/auth/domain/repository/auth_repository.dart';
import 'package:blog/core/model/auth/user.dart';
import 'package:blog/core/model/common/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Session, SupabaseClient, AuthException;

class AuthRepositoryImpl implements AuthRepository {
  /// Subapase kommunikációhoz kliens.
  final SupabaseClient _client;

  /// A bejelentkezett felhasználót tároló subject.
  final _userSubject = BehaviorSubject<User?>.seeded(null);

  /// A felhasználót elérhetővé tévő stream.
  Stream<User?> get user => _userSubject.stream;

  AuthRepositoryImpl({required SupabaseClient client}) : _client = client;

  /// [SupabaseClient] alapján az aktuális auth session.
  Session? get session => _client.auth.currentSession;

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    if (session == null) {
      return left(const Failure(message: 'A felhasználó nincs bejelentkezve!'));
    }

    return right(User(id: session!.user.id, email: session!.user.email!));
  }

  @override
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

  @override
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
