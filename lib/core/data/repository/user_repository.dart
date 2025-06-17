import 'package:blog/core/model/auth/user.dart';
import 'package:rxdart/subjects.dart';

/// A bejelentkezett felhasználó kezelését támogató repository.
class UserRepository {
  /// A bejelentkezett felhasználót tároló subject.
  final _userSubject = BehaviorSubject<User?>.seeded(null);

  /// A felhasználót elérhetővé tévő stream.
  Stream<User?> get user => _userSubject.stream;

  /// Felhasználó beállítása a kapott [user] paraméterrel.
  Future<void> setUser({required User? user}) async {
    _userSubject.add(user);
  }

  /// Felhasználó beállítása null-ra.
  Future<void> resetUser() async {
    await setUser(user: null);
  }

  /// Erőforrások felszabadítása.
  void dispose() {
    _userSubject.close();
  }
}
