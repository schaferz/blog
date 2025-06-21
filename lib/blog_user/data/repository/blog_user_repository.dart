import 'package:blog/blog_user/data/entity/blog_user.dart';
import 'package:blog/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ter_ui/ter_ui.dart';

/// Felhasználók repository.
class BlogUserRepository with TerBlocRepository<BlogUser> {
  /// Supabase kommunikációhoz kliens.
  final SupabaseClient _client;

  BlogUserRepository({required SupabaseClient client}) : _client = client;

  /// Adatok betöltése.
  Future<Either<Failure, Unit>> load() async {
    try {
      addJsonData(await _client.from('blog_user').select('*'));

      return right(unit);
    } catch (e) {
      addError(e);
      rethrow;
    }
  }

  @override
  BlogUser fromJson(Map<String, dynamic> jsonData) {
    return BlogUser.fromJson(jsonData);
  }
}
