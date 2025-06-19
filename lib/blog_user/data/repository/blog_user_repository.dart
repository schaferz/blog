import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Felhasználók repository.
class BlogUserRepository {
  /// Supabase kommunikációhoz kliens.
  final SupabaseClient _client;

  BlogUserRepository({required SupabaseClient client}) : _client = client;

  /// Összes felhasználó listázása.
  Future<Either<Failure, List<BlogUser>>> listUsers() async {
    try {
      final result = await _client.from('blog_user').select('*');
      final userResult = result.map((row) => BlogUser.fromJson(row)).toList();

      return right(userResult);
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
