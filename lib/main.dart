import 'package:blog/auth/data/repository/auth_repository_impl.dart';
import 'package:blog/auth/domain/repository/auth_repository.dart';
import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/core/route/app_routes.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          lazy: false,
          create: (_) => AuthRepositoryImpl(client: getIt<SupabaseClient>()),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(repository: context.read<AuthRepository>())),
      ],
      child: MaterialApp(
        theme: AppTheme.createThemeData(context),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.createAppRoutes(),
      ),
    );
  }
}
