import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog/auth/domain/repository/auth_repository.dart';
import 'package:blog/auth/presentation/bloc/auth_event.dart';
import 'package:blog/auth/presentation/bloc/auth_state.dart';
import 'package:blog/core/cubit/user_cubit.dart';
import 'package:blog/core/entity/user.dart';

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
  }

  /// Lásd [AuthSignInEvent].
  FutureOr<void> _signInEvent(AuthSignInEvent event, Emitter<AuthState> emmiter) async {
    final result = await _repository.signIn(email: event.email, password: event.password);

    result.fold(
      (l) => emmiter(AuthFailure(message: l.message)),
      (r) => _success(user: r, emmiter: emmiter),
    );
  }

  /// Sikeres bejelentkezés után az [AuthSuccess] esemény mellett, kezeli a
  /// [UserCubit.updateUserState]-et is.
  void _success({required User user, required Emitter<AuthState> emmiter}) {
    _userCubit.updateUserState(user: user);
    emmiter(AuthSuccess(user: user));
  }
}
