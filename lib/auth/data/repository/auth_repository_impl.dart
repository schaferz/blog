import 'package:blog/auth/domain/repository/auth_repository.dart';
import 'package:blog/core/entity/user.dart';
import 'package:blog/core/model/common/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Session, SupabaseClient, AuthException;

class AuthRepositoryImpl implements AuthRepository {
  /// Subapase kommunikációhoz kliens.
  final SupabaseClient _client;

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

      return right(User.fromJson(response.user!.toJson()));
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
