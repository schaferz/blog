import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/core/cubit/user_cubit.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/di.dart';
import 'package:blog/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (_) => di<UserCubit>()),
        BlocProvider<AuthBloc>(create: (_) => di<AuthBloc>()),
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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppTheme.cardBackgroundColor,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor.withAlpha((255.0 * 0.7).round())),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (!states.contains(WidgetState.hovered)) {
                return AppTheme.primaryColor.withAlpha((255.0 * 0.8).round());
              } else {
                return AppTheme.primaryColor;
              }
            }),
            foregroundColor: WidgetStatePropertyAll(AppTheme.foregroundColor),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.createAppRoutes(),
    );
  }
}
