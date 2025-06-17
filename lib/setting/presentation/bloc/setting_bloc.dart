import 'package:blog/setting/presentation/bloc/setting_event.dart';
import 'package:blog/setting/presentation/bloc/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Beállítások kezelését megvalósító [Bloc].
///
/// Lásd [SettingEvent], [SettingState].
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial());
}
