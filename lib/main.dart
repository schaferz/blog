import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/core/cubit/user_cubit.dart';
import 'package:blog/core/route/app_routes.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (_) => getIt<UserCubit>()),
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
      ],
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.createThemeData(context),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.createAppRoutes(),
    );
  }
}
