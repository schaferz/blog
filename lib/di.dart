import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// GetIt példány a függőségek regisztrálásához.
final getIt = GetIt.instance;

/// Függőségek előkészítése.
Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: 'https://rpcnttyfduknrvcxuhvq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwY250dHlmZHVrbnJ2Y3h1aHZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk5MDE1MDksImV4cCI6MjA2NTQ3NzUwOX0.TwkegidHzM7QzIqPrIXmuThVSNFcEpgElamraYfrxnc',
  );

  // SupabaseClient
  getIt.registerLazySingleton<SupabaseClient>(() => supabase.client);
}
