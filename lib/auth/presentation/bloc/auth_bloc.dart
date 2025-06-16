import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/auth/domain/repository/auth_repository.dart';
import 'package:blog/auth/presentation/bloc/auth_event.dart';
import 'package:blog/auth/presentation/bloc/auth_state.dart';
import 'package:blog/core/cubit/user_cubit.dart';
import 'package:blog/core/model/auth/user.dart';

/// Authentikációt megvalósító [Bloc].
///
/// Lásd [AuthEvent] és [AuthState].
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final UserCubit _userCubit;

  AuthBloc({required AuthRepository repository, required UserCubit userCubit})
    : _repository = repository,
      _userCubit = userCubit,
      super(const AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(const AuthLoading()));
    on<AuthSignInEvent>(_signInEvent);
    on<AuthSignOutEvent>(_signOutEvent);
  }

  /// Lásd [AuthSignInEvent].
  FutureOr<void> _signInEvent(AuthSignInEvent event, Emitter<AuthState> emmiter) async {
    final result = await _repository.signIn(email: event.email, password: event.password);

    result.fold(
      (l) => emmiter(AuthFailure(message: l.message)),
      (r) => _signInSuccess(user: r, emmiter: emmiter),
    );
  }

  /// Lásd [AuthSignOutEvent].
  FutureOr<void> _signOutEvent(AuthSignOutEvent event, Emitter<AuthState> emmiter) async {
    final result = await _repository.signOut();

    result.fold(
      (l) => emmiter(AuthFailure(message: l.message)),
      (r) => _signOutSuccess(emmiter: emmiter),
    );
  }

  /// Sikeres bejelentkezés után az [AuthSuccess] esemény mellett, kezeli a
  /// [UserCubit.updateUserState]-et is.
  void _signInSuccess({required User user, required Emitter<AuthState> emmiter}) {
    _userCubit.updateUserState(user: user);
    emmiter(AuthSuccess(user: user));
  }

  /// Sikeres kijelentkezés után az [AuthInitial] esemény mellett, kezeli a
  /// [UserCubit.updateUserState]-et is (null-al).
  void _signOutSuccess({required Emitter<AuthState> emmiter}) {
    _userCubit.updateUserState(user: null);
    emmiter(AuthInitial());
  }
}
