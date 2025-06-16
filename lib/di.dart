import 'package:blog/auth/data/repository/auth_repository_impl.dart';
import 'package:blog/auth/domain/repository/auth_repository.dart';
import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/core/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// GetIt példány a függőségek regisztrálásához.
final di = GetIt.instance;

/// Függőségek előkészítése.
Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: 'https://rpcnttyfduknrvcxuhvq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwY250dHlmZHVrbnJ2Y3h1aHZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk5MDE1MDksImV4cCI6MjA2NTQ3NzUwOX0.TwkegidHzM7QzIqPrIXmuThVSNFcEpgElamraYfrxnc',
  );

  // SupabaseClient
  di.registerLazySingleton<SupabaseClient>(() => supabase.client);

  // AuthRepository
  di.registerFactory<AuthRepository>(() => AuthRepositoryImpl(client: di<SupabaseClient>()));

  // UserCubit
  di.registerLazySingleton<UserCubit>(() => UserCubit());

  // AuthBloc
  di.registerLazySingleton<AuthBloc>(
    () => AuthBloc(repository: di<AuthRepository>(), userCubit: di<UserCubit>()),
  );
}
