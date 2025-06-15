import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/main/ui/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rpcnttyfduknrvcxuhvq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwY250dHlmZHVrbnJ2Y3h1aHZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk5MDE1MDksImV4cCI6MjA2NTQ3NzUwOX0.TwkegidHzM7QzIqPrIXmuThVSNFcEpgElamraYfrxnc',
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.backgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
