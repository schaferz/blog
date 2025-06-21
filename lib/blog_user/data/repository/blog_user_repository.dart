import 'dart:developer' show log;

import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Felhasználók repository.
class BlogUserRepository {
  /// Supabase kommunikációhoz kliens.
  final SupabaseClient _client;

  /// A betöltött adatot stream-elő rx subject.
  final _dataSubject = BehaviorSubject<List<BlogUser>?>.seeded(null);

  BlogUserRepository({required SupabaseClient client}) : _client = client;

  /// Adathozzáféréshez stream amit például a bloc használhat.
  ValueStream<List<BlogUser>?> get dataStream => _dataSubject.stream;

  /// Adatok betöltése.
  Future<Either<Failure, Unit>> load() async {
    try {
      final result = await _client.from('blog_user').select('*');
      final userResult = result.map((row) => BlogUser.fromJson(row)).toList();

      _dataSubject.add(userResult);

      return right(unit);
    } catch (e) {
      _dataSubject.addError(e);
      rethrow;
    }
  }

  /// Összes felhasználó listázása.
  Future<Either<Failure, List<BlogUser>>> listUsers() async {
    log('listUsers');

    try {
      final result = await _client.from('blog_user').select('*');
      final userResult = result.map((row) => BlogUser.fromJson(row)).toList();

      return right(userResult);
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  /// Belső stream-ek lezárása.
  void dispose() {
    _dataSubject.close();
  }
}
