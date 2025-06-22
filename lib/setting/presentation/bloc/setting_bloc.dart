import 'dart:async';

import 'package:blog/auth/auth.dart';
import 'package:blog/setting/data/entity/setting.dart';
import 'package:blog/setting/data/repository/setting_repository.dart';
import 'package:blog/setting/presentation/bloc/setting_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ter_ui/ter_ui.dart';

/// Típus definició [TerState] alapú [Emitter]-hez.
typedef SettingEmmiter = Emitter<TerState>;

/// Beállítások kezelését megvalósító [Bloc].
///
/// Lásd [SettingEvent], [TerState].
class SettingBloc extends Bloc<SettingEvent, TerState> {
  /// A beállítások repository.
  final SettingRepository _repository;

  /// Aktuális felhasználóhoz repository.
  final AuthRepository _authRepository;

  SettingBloc({required SettingRepository repository, required AuthRepository authRepository})
    : _repository = repository,
      _authRepository = authRepository,
      super(TerStateInitial()) {
    on<SettingEvent>((_, emit) => emit(const TerStateLoading()));
    on<SettingInitEvent>(_initEvent);
    on<SettingSaveEvent>(_saveEvent);
  }

  /// Lásd [SettingInitEvent].
  Future<void> _initEvent(SettingInitEvent event, SettingEmmiter emmiter) async {
    final user = await _authRepository.user.first;
    final result = await _repository.getSettingByEmail(email: user!.email);

    result.fold((l) => emmiter(TerStateFailure(error: l.message)), (r) {
      if (r != null) {
        return emmiter(TerStateSuccess<Setting>(data: [r]));
      } else {
        return emmiter(TerStateSuccess(data: [Setting(email: user.email)]));
      }
    });
  }

  /// Lásd [SettingSaveEvent].
  Future<void> _saveEvent(SettingSaveEvent event, SettingEmmiter emmiter) async {
    final result = await _repository.updateSetting(setting: event.data);

    result.fold(
      (l) => emmiter(TerStateFailure(error: l.message, data: [event.data])),
      (r) => emmiter(TerStateSuccess(data: [r])),
    );
  }
}
