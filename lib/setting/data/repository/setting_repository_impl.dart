import 'package:blog/core/core.dart';
import 'package:blog/setting/domain/entity/setting.dart';
import 'package:blog/setting/domain/repository/setting_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingRepositoryImpl implements SettingRepository {
  /// Supabase kommunikációhoz kliens.
  final SupabaseClient _client;

  SettingRepositoryImpl({required SupabaseClient client}) : _client = client;

  @override
  Future<Either<Failure, Setting>> getSettingByEmail({required String email}) async {
    try {
      final result = await _client.from('setting').select('*').eq("email", email);

      return right(Setting.fromJson(result.first));
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Setting>> updateSetting({required Setting setting}) async {
    try {
      final result = await _client.from('setting').upsert(setting.toJson());

      return right(Setting.fromJson(result.first));
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
