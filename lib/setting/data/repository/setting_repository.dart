import 'package:blog/core/core.dart';
import 'package:blog/setting/data/entity/setting.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Beállítások repository az eléréshez és karbantartáshoz szükséges funkciókkal.
class SettingRepository {
  /// Supabase kommunikációhoz kliens.
  final SupabaseClient _client;

  SettingRepository({required SupabaseClient client}) : _client = client;

  /// Beállítások elérése adott e-mail-el rendelkező felhasználóhoz.
  Future<Either<Failure, Setting?>> getSettingByEmail({required String email}) async {
    try {
      final result = await _client.from('setting').select('*').eq("email", email);
      Setting? resultEntity;

      if (result.isNotEmpty) {
        resultEntity = Setting.fromJson(result.first);
      }

      return right(resultEntity);
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  /// Setting beállítása.
  Future<Either<Failure, Setting>> updateSetting({required Setting setting}) async {
    try {
      await _client.from('setting').upsert(setting.toJson(), onConflict: 'id').select();

      return right(setting);
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
