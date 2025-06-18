import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/auth/auth.dart';

/// Authentikációt megvalósító [Bloc].
///
/// Lásd [AuthEvent] és [AuthState].
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc({required AuthRepository repository})
    : _repository = repository,
      super(const AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(const AuthLoading()));
    on<AuthSignInEvent>(_signInEvent);
    on<AuthSignOutEvent>(_signOutEvent);
  }

  /// Aktuális felhasználó e-mail cím, ha bejelentkezett állapotban vagyunk, egyébként üres String.
  get userEmail {
    if (state is AuthSuccess) {
      return (state as AuthSuccess).user.email;
    } else {
      return '';
    }
  }

  /// Lásd [AuthSignInEvent].
  Future<void> _signInEvent(AuthSignInEvent event, Emitter<AuthState> emmiter) async {
    final result = await _repository.signIn(email: event.email, password: event.password);

    result.fold(
      (l) => emmiter(AuthFailure(message: l.message)),
      (r) => _signInSuccess(user: r, emmiter: emmiter),
    );
  }

  /// Lásd [AuthSignOutEvent].
  Future<void> _signOutEvent(AuthSignOutEvent event, Emitter<AuthState> emmiter) async {
    final result = await _repository.signOut();

    result.fold(
      (l) => emmiter(AuthFailure(message: l.message)),
      (r) => _signOutSuccess(emmiter: emmiter),
    );
  }

  /// Sikeres bejelentkezés után az [AuthSuccess] esemény mellett, kezeli a
  /// [UserCubit.updateUserState]-et is.
  void _signInSuccess({required User user, required Emitter<AuthState> emmiter}) {
    emmiter(AuthSuccess(user: user));
  }

  /// Sikeres kijelentkezés után az [AuthInitial] esemény mellett, kezeli a
  /// [UserCubit.updateUserState]-et is (null-al).
  void _signOutSuccess({required Emitter<AuthState> emmiter}) {
    emmiter(AuthInitial());
  }
}
