import 'package:blog/core/model/common/failure.dart';
import 'package:blog/setting/domain/entity/setting.dart';
import 'package:fpdart/fpdart.dart';

/// Beállítások repository az eléréshez és karbantartáshoz szükséges funkciókkal.
abstract interface class SettingRepository {
  /// Beállítások elérése adott e-mail-el rendelkező felhasználóhoz.
  Future<Either<Failure, Setting>> getSettingByEmail({required String email});

  /// Setting beállítása.
  Future<Either<Failure, Setting>> updateSetting({required Setting setting});
}
