import 'package:blog/setting/presentation/bloc/setting_bloc.dart';
import 'package:blog/setting/presentation/bloc/setting_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Beállítások képernyő.
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
      create: (_) => SettingBloc()..add(const SettingLoadEvent()),
      child: BlocBuilder(
        builder: (context, state) {
          return Text('data');
        },
      ),
    );
  }
}
