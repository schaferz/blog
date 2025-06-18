import 'dart:async';

import 'package:blog/auth/auth.dart';
import 'package:blog/setting/data/entity/setting.dart';
import 'package:blog/setting/data/repository/setting_repository.dart';
import 'package:blog/setting/presentation/bloc/setting_event.dart';
import 'package:blog/setting/presentation/bloc/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Beállítások kezelését megvalósító [Bloc].
///
/// Lásd [SettingEvent], [SettingState].
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  /// A beállítások repository.
  final SettingRepository _repository;

  /// Aktuális felhasználóhoz repository.
  final AuthRepository _authRepository;

  SettingBloc({required SettingRepository repository, required AuthRepository authRepository})
    : _repository = repository,
      _authRepository = authRepository,
      super(SettingInitial()) {
    on<SettingEvent>((_, emit) => emit(const SettingLoading()));
    on<SettingInitEvent>(_initEvent);
    on<SettingLoadedEvent>(_loadedEvent);
  }

  /// Lásd [SettingInitEvent].
  FutureOr<void> _initEvent(SettingInitEvent event, Emitter<SettingState> emmiter) async {
    final user = await _authRepository.user.first;
    final result = await _repository.getSettingByEmail(email: user!.email);

    result.fold((l) => emmiter(SettingFailure(message: l.message)), (r) {
      if (r != null) {
        return emmiter(SettingLoaded(setting: r));
      } else {
        return emmiter(SettingLoaded(setting: Setting(email: user.email)));
      }
    });
  }

  /// Lásd [SettingLoadedEvent].
  FutureOr<void> _loadedEvent(SettingLoadedEvent event, Emitter<SettingState> emmiter) async {}
}
