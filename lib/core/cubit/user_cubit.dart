import 'package:bloc/bloc.dart';
import 'package:blog/core/cubit/user_state.dart';
import 'package:blog/core/model/auth/user.dart';

/// Felhasználókhoz [Cubit].
///
/// Lásd [UserState].
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitial());

  /// Felhasználó állapot frissítése.
  ///
  /// Opcionális [user] paraméter, mely null esetén kezdő állapotba kerülünk, egyébként [UserLoggedIn]-be.
  void updateUserState({required User? user}) {
    if (user == null) {
      emit(const UserInitial());
    } else {
      emit(UserLoggedIn(user: user));
    }
  }
}
