import 'dart:async';

import 'package:blog/setting/presentation/bloc/setting_event.dart';
import 'package:blog/setting/presentation/bloc/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Beállítások kezelését megvalósító [Bloc].
///
/// Lásd [SettingEvent], [SettingState].
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEvent>((_, emit) => emit(const SettingLoading()));
    on<SettingInitEvent>(_initEvent);
    on<SettingLoadedEvent>(_loadedEvent);
  }

  /// Lásd [SettingInitEvent].
  FutureOr<void> _initEvent(SettingInitEvent event, Emitter<SettingState> emmiter) async {}

  /// Lásd [SettingLoadedEvent].
  FutureOr<void> _loadedEvent(SettingLoadedEvent event, Emitter<SettingState> emmiter) async {}
}
