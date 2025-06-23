import 'package:blog/auth/auth.dart';
import 'package:blog/di.dart';
import 'package:blog/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (tester) async {
      await initDependencies();

      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthRepository>(
              lazy: false,
              create: (_) => AuthRepository(client: getIt<SupabaseClient>()),
            ),
          ],
          child: const AppWidget(),
        ),
      );

      final loginButton = find.text('Bejelentkezés');

      // találunk egy bejelentkezés gombot
      expect(loginButton, findsOneWidget);

      // megnyomjuk (demó app-ban most ki van töltve előre a user/pass)
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // sikeresen bejelentkeztünk (van egy 70% szöveg a főoldalon)
      expect(find.text('70%'), findsOneWidget);
    });
  });
}
