import 'package:blog/auth/auth.dart';
import 'package:blog/core/core.dart';
import 'package:blog/di.dart';
import 'package:blog/setting/data/entity/setting.dart';
import 'package:blog/setting/data/repository/setting_repository.dart';
import 'package:blog/setting/presentation/bloc/setting_bloc.dart';
import 'package:blog/setting/presentation/bloc/setting_event.dart';
import 'package:blog/setting/presentation/widget/setting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ter_ui/ter_ui.dart';

/// Beállítások képernyő.
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  /// [SettingRepository] és [SettingBloc] inject, valamint [SettingInitEvent] esemény kiváltása.
  @override
  Widget build(BuildContext context) {
    // inject repository
    return RepositoryProvider(
      create: (_) => SettingRepository(client: getIt<SupabaseClient>()),
      // inject bloc
      child: BlocProvider<SettingBloc>(
        create: (context) => SettingBloc(
          repository: context.read<SettingRepository>(),
          authRepository: context.read<AuthRepository>(),
        )..add(const SettingInitEvent()),
        child: const SettingContent(),
      ),
    );
  }
}

/// Beállítások képernyő tartalma.
class SettingContent extends StatelessWidget {
  const SettingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, TerBlocState>(
      builder: (context, state) {
        Setting? setting;

        if (state is TerBlocLoading) {
          return TerLoadingIndicator();
        } else if (state is TerBlocSuccess<Setting>) {
          setting = state.data[0];
        } else if (state is TerBlocFailure) {
          return ErrorDialog(message: state.error);
        }

        if (setting != null) {
          return AuthLayoutWidget(
            main: SettingForm(
              onSave: (data) {
                context.read<SettingBloc>().add(SettingSaveEvent(data: data));
              },
              data: setting,
            ),
          );
        }

        return const Placeholder();
      },
    );
  }
}
